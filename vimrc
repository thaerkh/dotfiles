" Settings
" =================

set nocompatible t_Co=256
set textwidth=0 wrap linebreak
set autoindent smartcase cursorline
set ts=2 sts=2 sw=2 et encoding=utf-8
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
noremap <F9> <nop>
noremap <F10> <nop>
noremap <F11> :mksession! sess.swp<CR>
noremap <F12> :tabnew $MYVIMRC<CR>

nmap <Up> <C-w>k
nmap <Down> <C-w>j
nmap <Left> <C-w>h
nmap <Right> <C-w>l

vmap <Up> <C-w>+
vmap <Down> <C-w>-
vmap <Left> <C-w><
vmap <Right> <C-w>>

let mapleader = " "
map <leader>w <C-w>w

noremap ; :
noremap \ ;
imap ;, <Esc>

" Scripts
" =================

function! ReIndent()
  let row = line('.')
  let col = virtcol('.')
  execute "normal gg=G"
  cal cursor(row, col)
  execute "normal zz"
endfunction

function! RemTrailingSpaces()
  let row = line('.')
  let col = virtcol('.')
  :%s/\s\+$//e
  cal cursor(row, col)
  execute "normal zz"
endfunction
