#!/bin/bash
#
# Скрипт установки базового окружения:
# - Настраивает необходимые директории
# - Копирует утилиты и конфиги
# - Создает симлинки для конфигурационных файлов
# - Устанавливает ZSH как оболочку по умолчанию

#sudo apt install curl wget bash-completion zsh ncdu lsd tree ripgrep


# ===== 1. Подготовка директорий =====
mkdir -p "${HOME}/.local/bin"
mkdir -p "${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload"

# ===== 2. Копирование файлов =====
# Копирование с сохранением прав (если файлы существуют)
[ -f "./files/plug.vim" ] && \
    cp -p "./files/plug.vim" "${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim"
[ -f "./files/zoxide" ] && cp "./files/zoxide" "${HOME}/.local/bin/zoxide"
[ -f "./files/rg" ] && cp "./files/rg" "${HOME}/.local/bin/rg"
[ -f "./files/lsd" ] && cp "./files/lsd" "${HOME}/.local/bin/lsd"

# ===== 3. Создание симлинков =====
# Удаляем старый .zshrc, если есть
rm -rf "${HOME}/.zshrc"
# Создаем симлинки на конфиги
ln -s "${HOME}/.dotfiles/.zshrc" "${HOME}/.zshrc"
mkdir -p "${HOME}/.config"
ln -s "${HOME}/.dotfiles/.config/nvim" "${HOME}/.config/nvim"
ln -s "${HOME}/.dotfiles/.config/zsh_functions" "${HOME}/.config/zsh_functions"
ln -s "${HOME}/.dotfiles/files/oh-my-zsh-offline" "${HOME}/.oh-my-zsh"

# надо понять в чём дело
cp -r ${HOME}/.dotfiles/files/oh-my-zsh/* ${HOME}/.oh-my-zsh

# ===== 4. Установка ZSH как оболочки по умолчанию =====
if command -v zsh >/dev/null 2>&1; then
    chsh -s "$(command -v zsh)"
else
    echo "Error: zsh is not installed!" >&2
    exit 1
fi

#git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
#git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git 


# ===== 5. Завершение =====
echo "Установка завершена."
echo "1. Откройте Neovim и выполните :PlugInstall для установки плагинов"
echo "2. Перезайдите в систему для применения ZSH"
