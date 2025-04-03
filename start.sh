#!/bin/bash

sudo apt install zsh mc bat ripgrep curl wget bash-completion ncdu lsd
mv ~/.dotfiles oldfiles/
cp -r .dotfiles ~/.dotfiles
mv -r ~/.config oldfiles/
ln -s ~/.dotfiles/.config ~/.config
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
mkdir ~/.soft
sudo tar -C ~/.soft -xzf nvim-linux-x86_64.tar.gz
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "use script \n./zsh.sh"
