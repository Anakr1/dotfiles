#!/bin/bash


sudo apt install zsh lsd neovim mc
cp -r ~/.dotfiles oldfiles/
rm ~/.dotfiles
cp .dotfiles ~/.dotfiles
mkdir oldfiles
cp -r ~/.zshrc oldfiles/
rm ~/.zshrc
ln -s ~/.dotfiles/.zshrc ~/.zshrc
cp -r ~/.config oldfiles/
rm ~/.config
ln -s ~/.dotfiles/.config ~/.config
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
echo "Open nvim and text :PlugInstall'"   # установка плагинов
echo "Finish"
