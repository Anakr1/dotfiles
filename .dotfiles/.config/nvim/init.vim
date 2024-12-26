"Включение строк по умолчанию
:set number

"Включение мыши и отключение
:set mouse=
":set mouse=a
"Keymap для управления в vim
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

" Подсветка синтаксиса
syntax on

"Игнор регистра при поиске
set ignorecase

" Отключение совместимости с vi. Нужно для правильной работы некоторых опций
set nocompatible


"Текст и табы
":set autoindent
:set tabstop=4
:set smarttab
:set shiftwidth=4
:set expandtab
":set et

" Перенос строк с края эрана
:set wrap



" Список репозиториев плагинов, на забудь потом PlugInstall"
call plug#begin()
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/terryma/vim-multiple-cursors'
Plug 'https://github.com/tpope/vim-surround'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'https://github.com/neoclide/coc.nvim'
call plug#end()



"" Бинды и команды NERDTree
nnoremap <M-x> :NERDTree<CR>
nnoremap <M-x> :NERDTreeToggle<CR>

" Закрыть vim, если единственная вкладка - это NERDTree
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif




" Клавиши мультикурсор
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-c>'
let g:multi_cursor_select_all_word_key = '<A-c>'
let g:multi_cursor_start_key           = 'g<C-c>'
let g:multi_cursor_select_all_key      = 'g<A-c>'
let g:multi_cursor_next_key            = '<C-c>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
"" stop bind and commands for NERDTree



"сохраннение клавишей F2 test
imap <F2> <Esc>:w<CR>
map <F2> <ESC>:w<CR>

imap <F10> <Esc>:q<CR>
map <F10> <ESC>:q<CR>

imap <F12> <Esc>:q!<CR>
map <F12> <ESC>:q!<CR>

" Снятие маркировки поиска
imap <F5> <Esc>:noh<CR>
map <F5> <ESC>:noh<CR>

" Отображение ковычек(вроде)
imap <F8> <Esc>:set cursorcolumn!<CR>
map <F8> <ESC>:set cursorcolumn!<CR>

"Нумерция строк
nnoremap <F7> :set number!<CR>

"Выполнение script.sh
nnoremap <F3> :!bash %

" Настройки темы airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_statusline_ontop=0
let g:airline_theme='deus'
let g:airline#extensions#tabline#formatter = 'default'


" Автокомплиты через Tab, но нужен coc
"inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"
