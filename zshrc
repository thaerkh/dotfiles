# ~/.zshrc

CASE_SENSITIVE=true
ENABLE_CORRECTION=true
ZLE_REMOVE_SUFFIX_CHARS=""

[[ $TERM == 'xterm' ]] && export TERM='xterm-256color'
export EDITOR='vim'
export FZF_DEFAULT_COMMAND='ag -g ""'

bindkey -e
bindkey \^U backward-kill-line

source ~/.antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle colored-man-pages
antigen bundle colorize
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

source ~/.aliases
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
