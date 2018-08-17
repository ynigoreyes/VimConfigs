#!bin/bash
echo "Copying current .vimrc to root directory"
echo "Must have brew installed"

# Vim Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

brew update

# Python setup
brew install python

# Neovim
pip3 install neovim

# Cmake for YCMD
brew install cmake

cp .vimrc ~/.vimrc
cp .tern-config ~/.tern-config
cp .vim/ftplugin/* ~/.vim/ftplugin

echo "\nDon't forget to run :PlugInstall!!!"

