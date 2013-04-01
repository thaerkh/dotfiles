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
PS1='[\u@\h \W]\$ '


# Compiler Shortcuts
#
alias g+='g++ -Wall -O0 -o'
alias gc='gcc -Wall -O0 -o'


# git
#
alias ga='git add .'
alias gt='git commit'
alias gca='git commit -a'
alias gcm='git commit -m'
alias gco='git checkout'
alias gpush='git push'
alias gpull='git pull'

# Arch Linux aliases
#

# powerpill/pacman
alias pacupg='sudo pacman -Syu'
alias powupg='sudo powerpill -Syu'        # Synchronize with repositories before upgrading packages that are out of date on the local system.
alias pacin='sudo pacman -S'
alias powin='sudo powerpill -S'           # Install specific package(s) from the repositories
alias pacins='sudo pacman -U'          # Install specific package not from the repositories but from a file 
alias pacre='sudo pacman -R'           # Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacrem='sudo pacman -Rns'        # Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacrep='pacman auto -Si'              # Display information about a given package in the repositories
alias pacreps='pacman auto -Ss'             # Search for package(s) in the repositories
alias pacloc='pacman auto -Qi'              # Display information about a given package in the local database
alias paclocs='pacman auto -Qs'             # Search for package(s) in the local database
alias pacqdt='sudo pacman -Rns $(pacman -Qdtq)' # Clean up dependencies
alias pacach='sudo pacman -Sc'			# Clean up cache, keeping cache for locally installed packages
alias paccch='sudo pacman -Scc'		# Clean up all cache and unused repos

# Additional powerpill alias
alias powupd='sudo powerpill -Sy && sudo abs'     # Update and refresh the local package and ABS databases against repositories
alias powinsd='sudo powerpill -S --asdeps'        # Install given package(s) as dependencies of another package
alias powmir='sudo powerpill -Syy'                # Force refresh of all package lists after updating /etc/powerpill.d/mirrorlist

# yaourt aliases
alias yaoupg='yaourt -Syua' 			# yaourt update
alias yaoin='yaourt -S'				# yaourt install
alias yaore='yaourt -R' 				# yaourt remove
alias yaorem='yaourt -Rns' 			# yaourt remove all including associated dependencies

# ecryptfs commands
alias emount='ecryptfs-mount-private' 
alias eumount='ecryptfs-umount-private'

alias poweroff='systemctl poweroff'
