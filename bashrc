# ~/.bashrc

[[ $- != *i* ]] && return

# General
# =================

export EDITOR="vim"
export TERM=gnome-256color
alias emacs='emacs -nw'
alias vi='vim'
alias ls='ls -FC --color=auto'
alias la='ls -aFC --color=auto'
alias ll='ls -aFl --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

complete -d cd
HISTCONTROL=ignoredups:ignorespace
PS1='[\u@\h \W]\$ '
HISTSIZE=10000;HISTFILESIZE=20000

# Dev
# =================

alias pull='git pull'
alias push='git push'
alias log='git log --graph --decorate --all'
alias ga='git add -A'
alias gcm='git commit -m'
alias gca='git commit --amend -m'
alias gco='git checkout'
alias gst='git status'
alias gri='git rebase -i'
alias grl='ga;gcm "dummy commit";gri HEAD~~'
alias gsf='git diff-tree --no-commit-id --name-only -r'
alias gdif='git diff'
alias gbr='git branch'

alias be='bundle exec'
alias redis='redis-server /usr/local/etc/redis.conf'

# Arch Linux
# =================

alias pacupg='sudo pacman -Syu'
alias pacin='sudo pacman -S'
alias pacrem='sudo pacman -Rns'
alias pacqdt='sudo pacman -Rns $(pacman -Qdtq)'
alias pacch='sudo pacman -Scc'

alias yaoupg='yaourt -Syua'
alias yaoin='yaourt -S'
alias yaore='yaourt -R'
alias yaorem='yaourt -Rns'

alias emount='ecryptfs-mount-private'
alias eumount='ecryptfs-umount-private'

alias poweroff='systemctl poweroff'

alias redvan='redshift -l 49.27:-123.10 -t 6500:3600 -g 0.8 -m vidmode -v'
