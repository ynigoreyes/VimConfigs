#!bin/bash
echo "Copying current .vimrc to root directory"
# Vim Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Cmake for YCMD
brew update
brew install cmake

cp .vimrc ~/.vimrc
cp .tern-config ~/.tern-config
cp .vim/ftplugin ~/.vim/ftplugin

echo "You must have python 3 installed to run some of the plugins"
echo "Don't forget to run :PlugInstall!!!"

