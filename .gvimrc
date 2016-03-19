scriptencoding utf-8
" vim: set ts=2 sts=2 sw=2 tw=0 et:

" --------------------------------------------------------------------
" メニューの文字化け解消.
" --------------------------------------------------------------------
if has('win32')"
  source $VIMRUNTIME/delmenu.vim
  set langmenu=ja_JP.utf-8
  source $VIMRUNTIME/menu.vim
endif

" --------------------------------------------------------------------
" window
" --------------------------------------------------------------------
" ツールバー非表示.
set guioptions-=T

" ビープ音無効.
set visualbell
set t_vb=

" ウィンドウサイズ復元.
let g:save_window_file = expand('~/.vimwinpos')
augroup SaveWindow
  autocmd!
  autocmd VimLeavePre * call s:save_window()
  function! s:save_window()
    let options = [
          \ 'set columns=' . &columns,
          \ 'set lines=' . &lines,
          \ 'winpos ' . getwinposx() . ' ' . getwinposy(),
          \ ]
    call writefile(options, g:save_window_file)
  endfunction
augroup END

if filereadable(g:save_window_file)
  execute 'source' g:save_window_file
endif

" --------------------------------------------------------------------
" colorscheme
" --------------------------------------------------------------------
colorscheme default
set background=light
colorscheme solarized

" --------------------------------------------------------------------
" font
" --------------------------------------------------------------------
if has('win32')
  set guifont=MS_Gothic:h10:cSHIFTJIS
  set guifontwide=MS_Gothic:h10:cSHIFTJIS
elseif has('mac')
  set guifont=Menlo\ Regular:h11
  set guifontwide=Menlo\ Regular:h11
endif

"----------------------------------------
" IME
"----------------------------------------
if has('multi_byte_ime') || has('xim')
  set iminsert=0 imsearch=0
  if has('xim') && has('GUI_GTK')
    " set imactivatekey=C-Space
  endif
  highlight Cursor guifg=NONE guibg=Green
  highlight CursorIM guifg=NONE guibg=Purple

  " モード切替時にIMの有効・無効を記憶する.
  if has('gui_macvim') && has('kaoriya')
    set noimdisable
    set noimdisableactivate
  endif
endif
