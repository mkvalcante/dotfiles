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
