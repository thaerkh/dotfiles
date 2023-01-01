# ~/.zshrc

CASE_SENSITIVE=true
ENABLE_CORRECTION=true
ZLE_REMOVE_SUFFIX_CHARS=""

[[ $TERM == 'xterm' ]] && export TERM='xterm-256color'
export EDITOR='vim'
export VIMRUNTIME=/usr/local/share/vim/vim90
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow"

export PYTHONPATH=$(cat ~/.python_paths 2>/dev/null | xargs -i echo -n :{})
export CLASSPATH="target/dependency/*:src/main/java/"
export GOPATH=~/.go
export PATH="$PATH:$GOPATH/bin"

source ~/.antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle MichaelAquilina/zsh-autoswitch-virtualenv
antigen bundle archlinux
antigen bundle colored-man-pages
antigen bundle colorize
antigen bundle docker
antigen bundle docker-compose
antigen bundle git
antigen bundle ubuntu
antigen bundle zdharma-continuum/fast-syntax-highlighting
antigen bundle zdharma-continuum/zsh-diff-so-fancy --branch=main
antigen bundle zdharma-continuum/zzcomplete
antigen bundle zsh-users/zsh-autosuggestions
antigen apply

HISTSIZE=1000000
SAVEHIST=$HISTSIZE

bindkey -e
bindkey \^U backward-kill-line
bindkey '^[ ' autosuggest-accept
bindkey '^[^M' autosuggest-execute
disable r

alias adoc='asciidoctor -D target -r asciidoctor-diagram -r asciidoctor-mathematical'
alias adocpdf='asciidoctor-pdf -r asciidoctor-diagram -r asciidoctor-mathematical'
alias cawk="awk -vFPAT='[^,]*|\"[^\"]*\"'"
alias stats="python -c 'import sys; import pandas as pd; data = pd.read_csv(sys.stdin, header=None);pd.options.display.max_colwidth=-1;pd.options.display.float_format = \"{:.4f}\".format;print(data.describe(include=\"all\"))'"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
