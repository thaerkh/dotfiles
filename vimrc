" Settings
" =================

" basic syntax and layout settings
set nocompatible t_Co=256
set textwidth=0 wrap linebreak
set ignorecase smartcase cursorline
set ts=2 sts=2 sw=2 et encoding=utf-8
set number ruler incsearch hidden
filetype plugin indent on
colorscheme jellybeans
syntax on

" case-specific syntax options
au FileType make setl noet
au FileType c,cpp setl cinkeys-=0# cino=:g0
au FileType python setl ts=4 sts=4 sw=4
au FileType asm setl ts=8 sts=8 sw=8 smartindent

" Command Shortcuts
" =================

" quick command shortcuts
noremap ; :
noremap ;; ;
imap ;, <Esc>
map ' "

" navigate wrapped lines as display lines
map j gj
map k gk

" use arrow keys to move between split buffer views in normal mode
nmap <Up> <C-w>k
nmap <Down> <C-w>j
nmap <Left> <C-w>h
nmap <Right> <C-w>l

" use arrow keys to resize split buffer views in visual mode
vmap <Up> <C-w>+
vmap <Down> <C-w>-
vmap <Left> <C-w><
vmap <Right> <C-w>>

" F-key shortcuts
map <F1> :set list!<CR>
map <F2> :set wrap!<CR>
map <F3> :Tlist<CR>
map <F4> :set number!<CR>
map <F5> :call ReIndent()<CR>
map <F6> :set hlsearch!<CR>
map <F7> :mksession! s.vim<CR>
map <F8> :%s/\s\+$//<CR>
"map <F9>
"map <F10>
map <F12> :tabnew $MYVIMRC<CR>

" mapleader shortcuts
let mapleader = " "
map <leader>w <C-w>w

" Scripts
" =================

" automatically source vimrc when modified
augroup myvimrc
  au!
  au BufWritePost $MYVIMRC so $MYVIMRC
augroup END

" reindent file and return to line
function! ReIndent()
  let curr_line = line('.')
  execute "normal gg=G"
  execute "normal " + curr_line + "gg"
  execute "normal zz"
endfunction

" remember cursor position in file sessions - source: vim.wikia.com
set viminfo='10,\"100,:20,%,n~/.viminfo
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction
augroup resCur
  au!
  au BufWinEnter * call ResCur()
augroup END
