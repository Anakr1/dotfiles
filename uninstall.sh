#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. && pwd)

echo "🔹 Удаление симлинков..."
[ -L "$HOME/.zshrc" ] && rm -v "$HOME/.zshrc"
[ -L "$HOME/.config/nvim" ] && rm -v "$HOME/.config/nvim"
[ -L "$HOME/.config/htop" ] && rm -v "$HOME/.config/htop"
[ -L "$HOME/.config/mc" ] && rm -v "$HOME/.config/mc"
[ -L "$HOME/.config/zsh_functions" ] && rm -v "$HOME/.config/zsh_functions"

echo "🔹 Удаление программ..."
[ -f "$HOME/.local/bin/fzf" ] && rm -v "$HOME/.local/bin/fzf"
[ -f "$HOME/.local/bin/zoxide" ] && rm -v "$HOME/.local/bin/zoxide"
[ -f "$HOME/.local/bin/nvim" ] && rm -v "$HOME/.local/bin/nvim"

echo "✅ Готово. Бэкапы сохранены в $DOTFILES_DIR/oldfiles/"
