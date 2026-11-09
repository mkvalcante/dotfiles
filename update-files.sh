#!/usr/bin/env bash
#
# update-files.sh
# Copies the config files listed in sources.json from their location on this
# system into the matching folders of the dotfiles repo.
#
# Works from any directory: it finds the repo from the script's own location.
# Expects update-files.sh and sources.json to live in the repo root.

set -euo pipefail

# Resolve the repo root (follows symlinks, so a symlinked script still works)
SCRIPT_DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd)"
SOURCES_FILE="$SCRIPT_DIR/sources.json"

# ZSH_CUSTOM is set by Oh My Zsh, not by bash, so give it Oh My Zsh's default
export ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# --- Checks -----------------------------------------------------------------

if ! command -v jq >/dev/null 2>&1; then
  echo "Error: 'jq' is required to read sources.json. Install it with: sudo apt install jq" >&2
  exit 1
fi

if [[ ! -f "$SOURCES_FILE" ]]; then
  echo "Error: sources.json not found at $SOURCES_FILE" >&2
  exit 1
fi

# --- Helpers ----------------------------------------------------------------

# Expands ~, $VAR and ${VAR} in a string using environment variables.
# Done by hand instead of eval, so nothing in sources.json can run as code.
expand_vars() {
  local s="$1" var val
  s="${s/#\~/$HOME}"
  while [[ "$s" =~ \$\{?([A-Za-z_][A-Za-z0-9_]*)\}? ]]; do
    var="${BASH_REMATCH[1]}"
    val="${!var-}"
    s="${s//"${BASH_REMATCH[0]}"/$val}"
  done
  printf '%s' "$s"
}

# --- Main -------------------------------------------------------------------

updated=0
unchanged=0
missing=0

while IFS=$'\t' read -r name raw_path; do
  if [[ -z "$name" || -z "$raw_path" ]]; then
    echo "Skipping entry with missing name or path"
    missing=$((missing + 1))
    continue
  fi

  # Keep everything inside the repo: no slashes or ".." in folder names
  if [[ "$name" == */* || "$name" == *..* ]]; then
    echo "Skipping '$name': folder names can't contain '/' or '..'"
    missing=$((missing + 1))
    continue
  fi

  src="$(expand_vars "$raw_path")"
  dest_dir="$SCRIPT_DIR/$name"
  dest="$dest_dir/$(basename "$src")"

  if [[ ! -f "$src" ]]; then
    echo "Not found, skipped: $src"
    missing=$((missing + 1))
    continue
  fi

  mkdir -p "$dest_dir"

  if [[ -f "$dest" ]] && cmp -s "$src" "$dest"; then
    echo "Unchanged: $name/$(basename "$src")"
    unchanged=$((unchanged + 1))
  else
    cp "$src" "$dest"
    echo "Updated:   $name/$(basename "$src")"
    updated=$((updated + 1))
  fi
done < <(jq -r '.[] | [.name, .path] | @tsv' "$SOURCES_FILE")

echo
echo "Done: $updated updated, $unchanged unchanged, $missing skipped."
