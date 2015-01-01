" ~/.vimrc

" Settings
" =================

set encoding=utf-8
set nocompatible t_Co=256
set list nowrap linebreak
set ts=2 sts=2 sw=2 et tw=0
set autoindent smartcase cursorline
set number ruler incsearch hidden
filetype plugin indent on
colorscheme jellybeans
syntax on

" Autocommands
" =================

au FileType make setl noet
au FileType c,cpp setl cinkeys-=0# cino=:g0
au FileType python setl ts=4 sts=4 sw=4
au FileType asm setl ts=8 sts=8 sw=8 smartindent

" Mappings
" =================

noremap <F1> :set list!<CR>
noremap <F2> :set wrap!<CR>
noremap <F3> :set number!<CR>
noremap <F4> :Tlist<CR>
noremap <F5> :NERDTreeToggle<CR>
noremap <F6> :set hlsearch!<CR>
noremap <F7> :call ReIndent()<CR>
noremap <F8> :call RemTrailingSpaces()<CR>

" Scripts
" =================

function! ReIndent()
  let curr_row = line('.')
  let curr_col = virtcol('.')
  execute "normal gg=G"
  cal cursor(curr_row, curr_col)
  execute "normal zz"
endfunction

function! RemTrailingSpaces()
  let curr_row = line('.')
  let curr_col = virtcol('.')
  :%s/\s\+$//e
  cal cursor(curr_row, curr_col)
  execute "normal zz"
endfunction
