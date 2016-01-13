scriptencoding utf-8
" vim: set ts=2 sts=2 sw=2 tw=0 et:

if !1 | finish | endif

" --------------------------------------------------------------------
" directories
" --------------------------------------------------------------------
let $MY_RTDIR = $HOME.'/.vim'

set swapfile
set dir=$MY_RTDIR/swap
set backup
set backupdir=$MY_RTDIR/backup
set undofile
set undodir=$MY_RTDIR/undo

" --------------------------------------------------------------------
" file encoding
" --------------------------------------------------------------------
if has('win32')
  set encoding=utf-8
  set termencoding=cp932
  set fileformat=unix
  set fileformats=unix,dos,mac
endif

if !has('kaoriya')
  set fileencodings=ucs-bom,utf-8,iso-2022-jp,cp932,euc-jp,default,latin
endif

" --------------------------------------------------------------------
" edit
" --------------------------------------------------------------------
" 日本語の行の連結時には空白を入力しない.
set formatoptions+=mM

" バッファ未保存でも他のバッファを開けるように.
set hidden

" ビープ音無効.
set visualbell
set t_vb=

" --------------------------------------------------------------------
" indent
" --------------------------------------------------------------------
set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=0
set expandtab
set autoindent
set smartindent

" --------------------------------------------------------------------
" search
" --------------------------------------------------------------------
set incsearch
set ignorecase
set smartcase
set hlsearch

" --------------------------------------------------------------------
" complement
" --------------------------------------------------------------------
set wildmenu
set wildmode=list:longest,full

" --------------------------------------------------------------------
" clipboard
" --------------------------------------------------------------------
set clipboard+=unnamed

" --------------------------------------------------------------------
" mouse
" --------------------------------------------------------------------
set mouse=a

" --------------------------------------------------------------------
" window
" --------------------------------------------------------------------
set number
set title
set showcmd
set showmode
set showmatch
set matchtime=1
set wrap
set iminsert=0
" 記号表示でカーソル位置がずれないようにする.
set ambiwidth=double
" Windowsのパス区切りに/を使えるようにする.
set shellslash
set cmdheight=2
set laststatus=2
set ruler
"set statusline=%<%f\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v\ %l/%L

" --------------------------------------------------------------------
" key remapping
" --------------------------------------------------------------------
" ; を : にリマップ.
nnoremap ; :

" --------------------------------------------------------------------
" 全角スペースの表示
" http://inari.hatenablog.com/entry/2014/05/05/231307
" --------------------------------------------------------------------
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme * call ZenkakuSpace()
    autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
  augroup END
  call ZenkakuSpace()
endif

" --------------------------------------------------------------------
" モードに応じてminttyのカーソル形状を変える
" http://qiita.com/usamik26/items/f733add9ca910f6c5784
" --------------------------------------------------------------------
if has('unix') && !has('mac')
  let &t_ti.="\e[1 q"
  let &t_SI.="\e[5 q"
  let &t_EI.="\e[1 q"
  let &t_te.="\e[0 q"
endif

" --------------------------------------------------------------------
" other settings
" --------------------------------------------------------------------
set runtimepath+=~/.vim
runtime! ../.vimrc.d/*.vim

" --------------------------------------------------------------------
" NeoBundle
" --------------------------------------------------------------------
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

let $MY_BUNDLEDIR = $MY_RTDIR.'/bundle'

if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=$MY_BUNDLEDIR/neobundle.vim/
endif

" Required:
call neobundle#begin(expand($MY_BUNDLEDIR))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

" ステータスラインを豪華に.
NeoBundle 'itchyny/lightline.vim'

" 行末の半角スペースを可視化
NeoBundle 'bronson/vim-trailing-whitespace'

" NERDTree
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'

" 選択範囲を S' などで括弧をつける.
NeoBundle 'tpope/vim-surround'

" markdown
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

" previm
let g:previm_open_cmd = ''
let g:previm_show_header = 0

" --------------------------------------------------------------------
" syntax highlighting
" --------------------------------------------------------------------
syntax on
