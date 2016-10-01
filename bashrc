# ~/.bashrc

[[ $- != *i* ]] && return

PS1='\[\033[38;5;2m\][\W]\$\[\033[00m\] '
HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoredups:ignorespace

[[ $TERM == 'xterm' ]] && export TERM='xterm-256color'
export EDITOR='vim'

export FZF_DEFAULT_COMMAND='ag -g ""'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

complete -d cd
shopt -s checkwinsize

source ~/.aliases

alias ls='ls -FC --color=auto'
alias grep='grep --color=auto'
