cp -r ~/.zshrc oldfiles/
rm -rf ~/.zshrc
ln -s .dotfiles/.zshrc ../.zshrc

echo "Open nvim and text :PlugInstall'"   # установка плагинов
echo "Finish"
#sudo apt install lsd
#snap install lsd
