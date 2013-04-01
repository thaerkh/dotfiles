" Settings
" =================

" basic syntax and layout settings
syntax on
set t_Co=256
set ts=2 sts=2 sw=2 et
set textwidth=0 wrap
set number ruler incsearch
colorscheme jellybeans
filetype plugin indent on

" case-specific syntax options
set cinkeys-=0# cino=:g0
au FileType python setl ts=4 sts=4 sw=4


" Command Shortcuts
" =================

" quick command shortcuts
noremap ; :
noremap \ ;
imap ;, <Esc>
vmap ;, <Esc>
map ' "

" fn key shortcuts
map <F2> :set wrap!<CR>
map <F3> :set hlsearch!<CR>
map <F4> :set number!<CR>

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


" mapleader Shortcuts
" =================
let mapleader = ","

map <leader>c :TlistOpen<CR>
map <leader>w <C-w><C-w>
map <leader>tn :tabnew<CR>


" Scripts
" =================

" <remember cursor position>
set viminfo='10,\"100,:20,%,n~/.viminfo

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END
" </remember cursor position> source: vim.wikia.com

" <swap window buffers>
function! MarkWindowSwap()
  let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
  let curNum = winnr()
  let curBuf = bufnr( "%" )
  exe g:markedWinNum . "wincmd w"
  let markedBuf = bufnr( "%" )
  exe 'hide buf' curBuf
  exe curNum . "wincmd w"
  exe 'hide buf' markedBuf 
endfunction

nmap <silent> <leader>mw :call MarkWindowSwap()<CR>
nmap <silent> <leader>pw :call DoWindowSwap()<CR>
" </swap window buffers> source: stackoverflow.com
