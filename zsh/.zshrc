export PATH="$PATH:$HOME/.local/bin:/usr/local/bin:/opt/nvim-linux-x86_64/bin"
export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.UTF-8

ZSH_THEME=""
HIST_STAMPS="dd.mm.yyyy"

HISTSIZE=10000
SAVEHIST=10000

zstyle ':omz:plugins:git' aliases no

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

eval "$(starship init zsh)"
