#!/bin/bash
#sudo apt install curl wget bash-completion zsh ncdu lsd tree 

# подготовка папок 
mkdir -p ~/.local/bin/
mkdir -p "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload

# копирование файлов
cp -p ./files/plug.vim "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim
cp ./files/zoxide ~/.local/bin/zoxide
cp ./files/rg ~/.local/bin/rg
cp ./files/lsd ~/.local/bin/lsd

# создание линков
rm -rf ~/.zshrc
ln -s ~/.dotfiles/.zshrc ~/.zshrc
mkdir -p ~/.config
ln -s ~/.dotfiles/.config/nvim ~/.config/nvim
ln -s ~/.dotfiles/.config/zsh_functions ~/.config/zsh_functions
ln -s ~/.dotfiles/files/oh-my-zsh-offline ~/.oh-my-zsh

#git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
#git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

echo "Open nvim and text :PlugInstall'"   # установка плагинов
echo "Finish"
echo ""
