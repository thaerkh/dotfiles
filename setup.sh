#!/bin/bash

set -e

echo "[INFO] Installing some dependencies." >&2
sudo apt install vim tmux silversearcher-ag git autoconf zsh

echo "[INFO] Copying dotfiles to home directory." >&2
ag -l | grep -v setup | xargs -i cp {} ~/.{}

echo "[INFO] Configuring miscellaneous settings." >&2
git config --global core.excludesfile ~/.gitignore_global

[[ $SHELL == '/bin/zsh' ]] || {
  echo "[INFO] Setting Zsh as default shell." >&2
  chsh -s /bin/zsh
}

echo "[INFO] Installing Zsh Antigen plugins." >&2
[ -d ~/.antigen/ ] || {
  git clone https://github.com/zsh-users/antigen.git ~/.antigen
}
zsh -c "source ~/.zshrc"

command -v ctags &>/dev/null || {
  echo "[INFO] Installing Universal Ctags." >&2
  git clone git@github.com:universal-ctags/ctags.git uctags
  cd uctags && ./autogen.sh && ./configure && make && sudo make install && cd .. && rm -rf uctags/
}

ls ~/.local/share/fonts/*Powerline* &>/dev/null || {
  echo "[INFO] Installing Powerline fonts." >&2
  git clone https://github.com/powerline/fonts.git /tmp/fonts-powerline
  /tmp/fonts-powerline/install.sh && rm -rf /tmp/fonts-powerline/
}

echo "[INFO] Installing Vim plugins." >&2
vim +PlugInstall +qall

echo "[INFO] Installing Tmux TPM plugins." >&2
[ -d ~/.tmux/plugins/tpm ] || {
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}
~/.tmux/plugins/tpm/bin/install_plugins

echo "[INFO] Airline everything." >&2
vim +"PromptlineSnapshot! /tmp/promptline.sh airline" +qall
cat /tmp/promptline.sh >> ~/.bashrc
cat /tmp/promptline.sh >> ~/.zshrc
vim +"TmuxlineSnapshot! /tmp/tmuxline.conf" +qall
cat /tmp/tmuxline.conf >> ~/.tmux.conf

echo "[INFO] Done!" >&2
