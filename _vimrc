let mapleader = ","
let g:no_html_toolbar = 'yes'
set guifont=Source\ Code\ Pro 

" SQL syntax -----------------
syntax on
filetype on
au BufNewFile,BufRead *.ds   set syntax=sql
au BufNewFile,BufRead *.alt   set syntax=sql
au BufNewFile,BufRead *.sec   set syntax=sql
au BufNewFile,BufRead *.pks   set syntax=sql
au BufNewFile,BufRead *.pkb   set syntax=sql
au BufNewFile,BufRead *.seq   set syntax=sql

" backup & swap ---------------
set backupdir=C:\TEMP\backup
set directory=C:\TEMP\swap

set nocompatible
colorscheme koehler

" WIndows ---------------------
set guioptions-=T "remove toolbar
set equalalways
set splitbelow splitright

" 256 Colors support
set t_Co=256



" NERDTree --------------------
autocmd vimenter * NERDTree
:noremap <Leader>n :NERDTreeToggle<CR>

" NERDComment -----------------
let NERDCreateDefaultMappings=0 
:map <Leader>c :call NERDComment(0, "toggle")<CR>


source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

