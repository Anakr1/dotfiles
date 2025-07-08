#!/bin/bash

sudo apt install zsh mc ripgrep curl wget bash-completion ncdu lsd fzf
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
mv ~/.dotfiles oldfiles/
cp -r .dotfiles ~/.dotfiles
mv ~/.config oldfiles/
ln -s ~/.dotfiles/.config ~/.config
curl -LO https://github.com/neovim/neovim/releases/download/v0.9.5/nvim-linux64.tar.gz
mkdir ~/.soft
tar -C ~/.soft -xzf nvim-linux64.tar.gz
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "use script \n./zsh.sh"
