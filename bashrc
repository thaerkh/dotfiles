#
# ~/.bashrc
#
#
export EDITOR="vim"
export TERM=gnome-256color
archey

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -FC --color=auto'
alias la='ls -aFC --color=auto'
PS1='[\u@\h \W]\$ '


# Compiler Shortcuts
#
alias g+='g++ -Wall -O0 -o'
alias gc='gcc -Wall -O0 -o'


# git
#
alias ga='git add'
alias gr='git rm'
alias gv='git mv'
alias gt='git commit'
alias gca='git commit -a'
alias gcm='git commit -m'
alias gco='git checkout'
alias gpush='git push origin master'
alias gpull='git pull origin master'


# Arch Linux aliases
#

# pacman aliases
alias pacupg='sudo pacman -Syu'
alias pacin='sudo pacman -S'
alias pacins='sudo pacman -U'   # Install specific package from a file
alias pacre='sudo pacman -R'    # Retain removed package configs/dependencies
alias pacrem='sudo pacman -Rns' # Remove packages & their dependencies
alias pacrep='pacman auto -Si'  # Display information about a given package 
alias pacreps='pacman auto -Ss' # Search for a package
alias pacloc='pacman auto -Qi'  # Display information about a local package 
alias paclocs='pacman auto -Qs' # Search for package(s) in the local database
alias pacqdt='sudo pacman -Rns $(pacman -Qdtq)' # Clean up dependencies
alias pacach='sudo pacman -Sc'	# Clean up cache but keep local package cache
alias paccch='sudo pacman -Scc'	# Clean up all cache and unused repos

# yaourt aliases
alias yaoupg='yaourt -Syua'
alias yaoin='yaourt -S'
alias yaore='yaourt -R'
alias yaorem='yaourt -Rns'

# ecryptfs commands
alias emount='ecryptfs-mount-private' 
alias eumount='ecryptfs-umount-private'

alias poweroff='systemctl poweroff'
