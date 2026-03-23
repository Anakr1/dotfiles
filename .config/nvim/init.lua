-- Установка <leader> клавиши
vim.g.mapleader = ' '

-- Основные настройки редактора
vim.opt.list = false       -- Не показывать скрытые символы (например, пробелы в конце)
vim.opt.wrap = false       -- Отключить перенос строк (иногда добавляет пробелы при выделении)
vim.opt.showbreak = ""     -- Убрать отступы для перенесённых строк (если wrap включён)
vim.opt.virtualedit = ""   -- Запретить курсору заходить за конец строки
vim.opt.number = true  -- Нумерация строк
vim.opt.ignorecase = true  -- Игнорировать регистр в поиске
vim.opt.smartcase = true  -- Исключение: учитывать регистр, если есть заглавные буквы
vim.opt.autoindent = true  -- Автоотступы
vim.opt.tabstop = 2  -- Длина табуляции
vim.opt.shiftwidth = 2  -- Размер отступов
vim.opt.expandtab = true  -- Использовать пробелы вместо табуляции

-- Умная настройка clipboard: только если доступен
if vim.fn.has('clipboard') == 1 then
  vim.opt.clipboard = 'unnamedplus'
else
  -- Для Termius и других терминалов без clipboard
  vim.opt.clipboard = ''
end


-- Кроссплатформенные настройки
if vim.fn.has('win32') == 1 then
  -- Windows
  vim.opt.shell = 'powershell'  -- Используем PowerShell в терминале
  vim.g.neovim_executable = 'C:\\Program Files\\Neovim\\bin\\nvim.exe'
  vim.cmd [[
    set keymap=russian-jcukenwin
    set iminsert=0
    set imsearch=0
    highlight lCursor guifg=NONE guibg=Cyan
  ]]
else
  -- Linux/Ubuntu
  -- Сохранение и выход
  vim.keymap.set('i', '<F2>', '<Esc>:w<CR>', { desc = 'Save file', silent = true })
  vim.keymap.set('n', '<F2>', ':w<CR>', { desc = 'Save file', silent = true })
  vim.keymap.set('i', '<F10>', '<Esc>:q<CR>', { desc = 'Quit without saving', silent = true })
  vim.keymap.set('n', '<F10>', ':q<CR>', { desc = 'Quit without saving', silent = true })
  vim.keymap.set('i', '<F12>', '<Esc>:q!<CR>', { desc = 'Force quit without saving', silent = true })
  vim.keymap.set('n', '<F12>', ':q!<CR>', { desc = 'Force quit without saving', silent = true })
  
  -- Для выделения и курсора
  vim.keymap.set('n', '<F8>', ':set cursorcolumn!<CR>', { silent = true })
  vim.keymap.set('n', '<F7>', ':set number!<CR>', { silent = true })

  -- Бинды для NERDTree
  vim.keymap.set('n', '<M-x>', ':NERDTreeToggle<CR>', { silent = true })

  -- Закрытие, если остался только NERDTree
  vim.cmd [[
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
  ]]

  -- Настройки Airline
  vim.g['airline#extensions#tabline#enabled'] = 1
  vim.g.airline_powerline_fonts = 1
  vim.g.airline_theme = 'deus'
  -- Синтаксис, мышка, смена режимом, голубой курсор
  vim.cmd('syntax enable')  -- Включает подсветку синтаксиса 
  vim.opt.mouse = ""
  vim.cmd [[
    set keymap=russian-jcukenwin
    set iminsert=0
    set imsearch=0
    highlight lCursor guifg=NONE guibg=Cyan
  ]]
end


-- Кроссплатформенные настройки плагинов
if vim.fn.has('win32') == 1 then
  -- Windows плагины
  vim.cmd [[
    call plug#begin('~/.vim/plugged')

    " Указываем конец загрузки плагинов
    call plug#end()
  ]]
else
  -- Linux/Ubuntu плагины
  vim.cmd [[
    call plug#begin('~/.vim/plugged')
    Plug 'preservim/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'ojroques/vim-oscyank'
    call plug#end()
  ]]
end



-- Кастомные бинды
vim.keymap.set({ 'n', 'v' }, 'j', 'h')
vim.keymap.set({ 'n', 'v' }, 'k', 'j')
vim.keymap.set({ 'n', 'v' }, 'l', 'k')
vim.keymap.set({ 'n', 'v' }, ';', 'l')
vim.keymap.set('n', '\'', ';')
vim.keymap.set('v', 'p', 'P')
vim.keymap.set('n', 'U', '<C-r>')
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>', { silent = true })


