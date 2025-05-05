-- Установка <leader> клавиши
vim.g.mapleader = ' '

-- Основные настройки редактора
vim.opt.number = true  -- Нумерация строк
vim.opt.clipboard = 'unnamedplus'  -- Синхронизация с буфером обмена
vim.opt.ignorecase = true  -- Игнорировать регистр в поиске
vim.opt.smartcase = true  -- Исключение: учитывать регистр, если есть заглавные буквы
vim.opt.autoindent = true  -- Автоотступы
vim.opt.tabstop = 2  -- Длина табуляции
vim.opt.shiftwidth = 2  -- Размер отступов
vim.opt.expandtab = true  -- Использовать пробелы вместо табуляции

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
  vim.keymap.set('i', '<F2>', '<Esc>:w<CR>', { silent = true })
  vim.keymap.set('n', '<F2>', ':w<CR>', { silent = true })
  vim.keymap.set('i', '<F10>', '<Esc>:q<CR>', { silent = true })
  vim.keymap.set('n', '<F10>', ':q<CR>', { silent = true })

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


