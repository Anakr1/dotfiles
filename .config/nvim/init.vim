
"Нумерция строк
:set number
"Включение мыши
" :set mouse=a
"Текст и табы
:set autoindent
:set tabstop=4
:set smarttab
:set shiftwidth=4
:set expandtab
:set et

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
call plug#end()


"" Бинды и команды NERDTree
nnoremap <M-x> :NERDTree<CR>
nnoremap <M-x> :NERDTreeToggle<CR>

autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif



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

