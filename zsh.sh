mv ~/.zshrc oldfiles/
ln -s ~/.dotfiles/.zshrc ~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

echo "Open nvim and text :PlugInstall'"   # установка плагинов
echo "Finish"
#sudo apt install lsd
#snap install lsd
