scriptencoding utf-8

" --------------------------------------------------------------------
" メニューの文字化け解消.
" --------------------------------------------------------------------
if has('win32')
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

" --------------------------------------------------------------------
" ウィンドウサイズ復元.
" --------------------------------------------------------------------
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
" font
" --------------------------------------------------------------------
if has('win32')
  set guifont=MS_Gothic:h10:cSHIFTJIS
  set guifontwide=MS_Gothic:h10:cSHIFTJIS
elseif has('mac')
  set guifont=Menlo\ Regular:h11
  set guifontwide=Menlo\ Regular:h11
endif

" --------------------------------------------------------------------
" color scheme
" --------------------------------------------------------------------
colorscheme default
set background=light

" --------------------------------------------------------------------
" IME
" --------------------------------------------------------------------
if has('multi_byte_ime') || has('xim')
  " モード切替時にIMの状態を復元しない.
  if has('gui_macvim') && has('kaoriya')
    set imdisableactivate
  endif

  " IMの状態に合わせてカーソル色を変更する.
  if has('win32') || has('mac')
    highlight Cursor guifg=NONE guibg=Green
    highlight CursorIM guifg=NONE guibg=Purple
  endif
endif

" --------------------------------------------------------------------
" vim: set ts=2 sts=2 sw=2 tw=0 et:
