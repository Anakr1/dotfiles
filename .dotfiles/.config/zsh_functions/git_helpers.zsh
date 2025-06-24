#!/usr/bin/env zsh

# Функция для коммитов с именем ветки
ggc() {
  if [ $# -eq 0 ]; then
    echo "Ошибка: Требуется сообщение коммита"
    return 1
  fi
  
  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "Ошибка: Вы не в Git-репозитории"
    return 1
  fi

  local branch_name
  branch_name=$(git branch --show-current 2>/dev/null)
  
  if [ -z "$branch_name" ]; then
    echo "Ошибка: Не удалось определить ветку"
    return 1
  fi

  git commit -m "${branch_name}: $*"
}

# Функция для пуша текущей ветки
ggp() {
  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "Ошибка: Вы не в Git-репозитории"
    return 1
  fi

  local branch_name
  branch_name=$(git branch --show-current 2>/dev/null)
  
  if [ -z "$branch_name" ]; then
    echo "Ошибка: Не удалось определить ветку"
    return 1
  fi

  echo "Пуш ветки '$branch_name' в origin"
  git push origin "$branch_name"
}
