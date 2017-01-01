#!/bin/bash

set -e

git_library() {
    if [ -d $2 ]; then
        echo "[INFO] Updating $2." >&2
        git -C $2 pull
    else
        if [ "$#" -ne 3 ]; then
            shallow_depth='--depth=1'
        fi
        echo "[INFO] Cloning into $2." >&2
        git clone $shallow_depth $1 $2
    fi
}

echo "[INFO] Installing environment requirements." >&2
sudo apt install\
    autoconf\
    git\
    inotify-tools\
    latexmk\
    ruby\
    pass\
    silversearcher-ag\
    tmux\
    zsh

echo "[INFO] Copying dotfiles to home directory." >&2
rsync -a vim/ ~/.vim
ag -l --depth 1 | grep -v setup | xargs -i cp {} ~/.{}

echo "[INFO] Installing Browserpass." >&2
[ -d ~/.browserpass ] || {
curl -Lo /tmp/browserpass.zip https://github.com/dannyvankooten/browserpass/releases/download/1.0.2/browserpass-linux64.zip
unzip -o /tmp/browserpass.zip -d ~/.browserpass
~/.browserpass/install.sh && rm /tmp/browserpass.zip
}

echo "[INFO] Configuring Git defaults." >&2
git config --global core.excludesfile ~/.gitignore_global
git config --global pull.rebase true
git config --global push.default simple

[[ $SHELL == '/bin/zsh' ]] || {
echo "[INFO] Setting Zsh as default shell." >&2
chsh -s /bin/zsh
}

echo "[INFO] Installing Zsh Antigen plugins." >&2
git_library https://github.com/zsh-users/antigen.git ~/.antigen
zsh -c "source ~/.zshrc"

echo "[INFO] Installing Vim plugins." >&2
vim +PlugInstall +qall

echo "[INFO] Installing Powerline fonts." >&2
git_library https://github.com/powerline/fonts.git ~/.fonts-powerline
~/.fonts-powerline/install.sh

echo "[INFO] Installing Tmux TPM plugins." >&2
git_library https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

echo "[INFO] Airline everything." >&2
vim +"PromptlineSnapshot! /tmp/promptline.sh airline" +qall
cat /tmp/promptline.sh >> ~/.zshrc
vim +"TmuxlineSnapshot! /tmp/tmuxline.conf" +qall
cat /tmp/tmuxline.conf >> ~/.tmux.conf

echo "[INFO] Installing Elixir" >&2
sudo apt install elixir
curl https://raw.githubusercontent.com/mmorearty/elixir-ctags/master/.ctags >> ~/.ctags
git_library https://github.com/elixir-lang/elixir ~/.elixir 0
[[ $(elixir --version | tail -1) =~ .*1.4.* ]] || {
cd ~/.elixir
git checkout v1.4 && make clean && sudo make install
cd -
}

echo "[INFO] Installing Go." >&2
sudo apt install golang
go get github.com/Masterminds/glide
cd $GOPATH/src/github.com/Masterminds/glide && make build && cd -
eval $(grep GOPATH zshrc) && vim +GoInstallBinaries +qall

echo "[INFO] Installing Node.js." >&2
[[ $(node -v) =~ 7.5.* ]] || {
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
sudo apt-get install nodejs
}

echo "[INFO] Installing R." >&2
sudo apt install libcurl4-openssl-dev libxml2-dev r-base

echo "[INFO] Installing Ruby." >&2
git_library https://github.com/rbenv/rbenv.git ~/.rbenv
git_library https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
rbenv_bin='export PATH="$HOME/.rbenv/bin:$PATH"'
grep "$rbenv_bin" ~/.zshrc &>/dev/null || echo $rbenv_bin >> ~/.zshrc
rbenv_init='eval "$(rbenv init -)"'
grep "$rbenv_init" ~/.zshrc &>/dev/null || echo $rbenv_init >> ~/.zshrc
rbenv_build='export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"'
grep "$rbenv_build" ~/.zshrc &>/dev/null || echo $rbenv_build >> ~/.zshrc
eval $rbenv_bin && rbenv install -s 2.4.0 && rbenv global 2.4.0 && sudo gem install bundler --no-ri --no-rdoc

echo "[INFO] Installing Rust." >&2
sudo apt install cargo rustc

echo "[INFO] Installing PostgreSQL." >&2
sudo apt install postgresql libpq-dev

echo "[INFO] Installing Scala." >&2
sudo apt install scala sbt
cat ~/.vim/plugged/vim-scala/ctags/scala.ctags >> ~/.ctags

echo "[INFO] Installing Universal Ctags." >&2
command -v ctags || {
git_library https://github.com/universal-ctags/ctags.git ~/.universal_ctags
cd ~/.universal_ctags && ./autogen.sh && ./configure && make && sudo make install && cd -
}

echo "[INFO] Done!" >&2
