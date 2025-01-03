#!/bin/bash


sudo apt install zsh lsd neovim mc
mkdir oldfiles
cp -r ~/.dotfiles oldfiles/
rm -rf ~/.dotfiles
cp -r .dotfiles ~/.dotfiles
cp -r ~/.zshrc oldfiles/
rm -rf ~/.zshrc
ln -s ~/.dotfiles/.zshrc ~/.zshrc
cp -r ~/.config oldfiles/
rm -rf ~/.config
ln -s ~/.dotfiles/.config ~/.config
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
echo "Open nvim and text :PlugInstall'"   # установка плагинов
echo "Finish"
