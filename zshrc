# ~/.zshrc

CASE_SENSITIVE=true
ENABLE_CORRECTION=true
ZLE_REMOVE_SUFFIX_CHARS=""

[[ $TERM == 'xterm' ]] && export TERM='xterm-256color'
export EDITOR='vim'
export FZF_DEFAULT_COMMAND='ag -g ""'

export PYTHONPATH=$(cat ~/.python_paths 2>/dev/null | xargs -i echo -n :{})
export CLASSPATH="target/dependency/*:src/main/java/"

export GOPATH=~/.go
export PATH="$PATH:$GOPATH/bin"

bindkey -e
bindkey \^U backward-kill-line
disable r

source ~/.antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle archlinux
antigen bundle colored-man-pages
antigen bundle colorize
antigen bundle git
antigen bundle ubuntu
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

source ~/.aliases
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
