scriptencoding utf-8
" vim: set ts=2 sts=2 sw=2 tw=0 et:

if !1 | finish | endif

" directory {
let $MY_RTDIR = $HOME.'/.vim'
set runtimepath^=$MY_RTDIR

set swapfile
set dir=$MY_RTDIR/swap
set backup
set backupdir=$MY_RTDIR/backup
set undofile
set undodir=$MY_RTDIR/undo
" }

" vim-plug {
silent! call plug#begin(expand('$MY_RTDIR/plugged'))

Plug 'itchyny/lightline.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-surround'
Plug 'osyo-manga/vim-over'
Plug 'vim-jp/vimdoc-ja'
Plug 'thinca/vim-zenspace'
Plug 'jacoborus/tender.vim'

call plug#end()
" }

" other plugin {
packadd! matchit
" }

" file encoding {
if has('win32')
  set encoding=utf-8
  set termencoding=cp932
  set fileformat=unix
  set fileformats=unix,dos,mac
endif

if !has('kaoriya')
  set fileencodings=ucs-bom,utf-8,iso-2022-jp,cp932,euc-jp,default,latin
endif
" }

" edit {
" 日本語の行の連結時には空白を入力しない.
set formatoptions+=mM

set hidden
set visualbell
set t_vb=
set clipboard&
if has('unnamedplus')
  set clipboard^=unnamedplus
else
  set clipboard^=unnamed
endif
" }

" indent {
set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=0
set expandtab
set autoindent
set smartindent
" }

" search {
set incsearch
set ignorecase
set smartcase
set hlsearch
" }

" complement {
set wildmenu
set wildmode=list:longest,full
" }

" window {
set number
set title
set showcmd
set showmode
set showmatch
set matchtime=1
set wrap
if exists('&ambiwidth')
  set ambiwidth=double
endif
set shellslash
set cmdheight=2
set laststatus=2
set ruler
set statusline=%<%f\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v\ %l/%L
set mouse=a
" }

" color scheme {
syntax enable
if !has('mac')
  set termguicolors
endif
colorscheme tender
set background=dark
" }

" others {
runtime! ../.vimrc.d/*.vim
" }
