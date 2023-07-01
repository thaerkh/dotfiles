# Plugins
source /usr/share/zsh/share/antigen.zsh
antigen use oh-my-zsh
antigen bundle MichaelAquilina/zsh-autoswitch-virtualenv
antigen bundle archlinux
antigen bundle colored-man-pages
antigen bundle docker
antigen bundle git
antigen bundle ubuntu
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

# Miscellaneous
ZSH_AUTOSUGGEST_IGNORE_WIDGETS+=(backward-kill-word kill-word)
export CASE_SENSITIVE="true"
export EDITOR="nvim"

# History
export HISTSIZE=1000000
export SAVEHIST=$HISTSIZE
setopt HIST_SAVE_NO_DUPS

# Paths
export GOPATH=/home/$USER/.go
export RUBYPATH=$(bundler env 2>/dev/null | grep 'User Path' | awk '{print $NF}')
export PATH="$PATH:$GOPATH/bin:$RUBYPATH/bin"
export RIPGREP_CONFIG_PATH="/home/$USER/.ripgreprc"

# Bindings
bindkey \^U backward-kill-line  # cursor-sensitive ctrl-u
disable r                       # conflicts with R

# FZF
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
