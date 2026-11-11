alias zshrc='$EDITOR ~/.zshrc'
alias aliases='$EDITOR $ZSH_CUSTOM/aliases.zsh'
alias sc='echo $?'
alias path='echo "$PATH" | tr ":" "\n"'
alias iplocal='hostname -I'

# Listing files
alias ls='ls --color=auto'
alias ll='ls -lah'
alias la='ls -A'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'

# Safety: ask before overwriting or deleting
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'

# Package management (Debian)
alias update='sudo apt update && sudo apt upgrade'
alias install='sudo apt install'
alias remove='sudo apt remove'
alias list='apt list'
alias search='apt search'

# Handy extras
alias grep='grep --color=auto'
alias c='clear'
alias reload='exec zsh'

# Git
alias gi='git init -b main'
alias gs='git status'
alias ga='git add'
alias gl='git log'
alias gb='git branch'
alias gm='git merge'
alias gc='git commit'
alias gp='git push'
alias gd='git diff'
alias gaa='git add --all'
alias gcm='git commit -m'
alias glo='git log --oneline'
alias glp='git log --all --abbrev-commit --decorate --graph --stat --date=relative'
alias gsw='git switch'

# Tree
alias tree='tree --dirsfirst'
alias tree2='tree -L 2'

# Listing
alias ls='eza --icons --group-directories-first'
alias lsl='eza -l --icons --group-directories-first'
alias lsla='eza -la --icons --group-directories-first'
