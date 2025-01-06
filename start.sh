#!/bin/bash

sudo apt install zsh neovim mc bat ripgrep
mkdir oldfiles
cp -r ~/.dotfiles oldfiles/
sudo rm -rf ~/.dotfiles
cp -r .dotfiles ~/.dotfiles
cp -r ~/.config oldfiles/
rm -rf ~/.config
ln -s .dotfiles/.config ../.config
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#use second script
