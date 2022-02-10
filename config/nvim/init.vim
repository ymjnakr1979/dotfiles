scriptencoding utf-8
" vim: set ts=2 sts=2 sw=2 tw=0 et:

" vim-plug {
call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-surround'
Plug 'osyo-manga/vim-over'
Plug 'thinca/vim-zenspace'
Plug 'jacoborus/tender.vim'
Plug 'https://github.com/adelarsq/vim-matchit'

call plug#end()
" }

" edit {
set hidden
" 日本語の行の連結時には空白を入力しない.
set formatoptions+=mM
set clipboard+=unnamed,unnamedplus
" }

" indent {
set smartindent
" }

" search {
set ignorecase
set smartcase
" }

" window {
set number
set title
set showcmd
set showmatch
set matchtime=1
set ambiwidth=double
set cmdheight=2
set mouse=a
" }

" color scheme {
syntax enable
set termguicolors
colorscheme tender
set background=dark
" }
