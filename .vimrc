scriptencoding utf-8

if !1 | finish | endif

" --------------------------------------------------------------------
" directory
" --------------------------------------------------------------------
let $MY_RTDIR = $HOME.'/.vim'
set runtimepath^=$MY_RTDIR

set swapfile
set dir=$MY_RTDIR/swap
set backup
set backupdir=$MY_RTDIR/backup
set undofile
set undodir=$MY_RTDIR/undo

" --------------------------------------------------------------------
" vim-plug
" --------------------------------------------------------------------
silent! call plug#begin(expand('$MY_RTDIR/plugged'))

Plug 'itchyny/lightline.vim'
Plug 'bronson/vim-trailing-whitespace'

" NERDTree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" 選択範囲を S' などで括弧をつける.
Plug 'tpope/vim-surround'

" markdown
Plug 'kannokanno/previm'
Plug 'tyru/open-browser.vim'

" 一括置換時に対象文字列をハイライト/プレビュー.
Plug 'osyo-manga/vim-over'

call plug#end()

" --------------------------------------------------------------------
" plugin settings
" --------------------------------------------------------------------
" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden = 1
nnoremap <silent><C-\> :NERDTreeToggle<CR>

" netrw
" netrwは常にtree view
let g:netrw_liststyle = 3
" 'v'でファイルを開くときは右側に開く.
let g:netrw_altv = 1
" 'o'でファイルを開くときは下側に開く.
let g:netrw_alto = 1

" previm
let g:previm_open_cmd = ''
let g:previm_show_header = 0

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
set nonumber
set title
set showcmd
set showmode
set showmatch
set matchtime=1
set wrap
set iminsert=0
" 記号表示でカーソル位置がずれないようにする.
if exists('&ambiwidth')
  set ambiwidth=double
endif
" Windowsのパス区切りに/を使えるようにする.
set shellslash
set cmdheight=2
set laststatus=2
set ruler
set statusline=%<%f\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v\ %l/%L

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
" 80カラムに線を表示する.
" --------------------------------------------------------------------
if (exists('+colorcolumn'))
  set colorcolumn=80
  highlight ColorColumn ctermbg=9
endif

" --------------------------------------------------------------------
" モードに応じてminttyのカーソル形状を変える
" http://qiita.com/usamik26/items/f733add9ca910f6c5784
" --------------------------------------------------------------------
"if has('unix') && !has('mac')
"  let &t_ti.="\e[1 q"
"  let &t_SI.="\e[5 q"
"  let &t_EI.="\e[1 q"
"  let &t_te.="\e[0 q"
"endif

" --------------------------------------------------------------------
" color scheme
" --------------------------------------------------------------------
colorscheme default
"set background=light

" --------------------------------------------------------------------
" syntax highlighting
" --------------------------------------------------------------------
syntax on

" --------------------------------------------------------------------
" key mapping
" --------------------------------------------------------------------
nnoremap ; :

" --------------------------------------------------------------------
" others
" --------------------------------------------------------------------
runtime! ../.vimrc.d/*.vim

" --------------------------------------------------------------------
" vim: set ts=2 sts=2 sw=2 tw=0 et:
