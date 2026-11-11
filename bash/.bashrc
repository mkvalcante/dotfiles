# ~/.bashrc

# Only run in interactive shells
case $- in *i*) ;; *) return;; esac

# History
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=20000
shopt -s histappend checkwinsize

# Prompt: user@host:dir$
PS1='\[\e[1;32m\]\u@\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]\$ '

# Colors and aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# Completion
if ! shopt -oq posix && [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
fi
