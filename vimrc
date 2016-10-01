" ~/.vimrc

" Plug
" =================
if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')
Plug 'edkolev/promptline.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'SirVer/ultisnips'
Plug 'ajh17/VimCompletesMe'
Plug 'easymotion/vim-easymotion'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'neomake/neomake'
Plug 'thaerkh/vim-workspace'
Plug 'tpope/vim-fugitive'

Plug 'davidhalter/jedi-vim'
Plug 'derekwyatt/vim-scala'
Plug 'tmux-plugins/vim-tmux'
call plug#end()

" Settings
" =================
colorscheme jellybeans
set expandtab
set list
set textwidth=0
set noswapfile
set sw=2 ts=2 sts=2

let g:workspace_sensible_settings = 1

let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tmuxline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'wombat'

let g:promptline_preset = {
      \'a': [promptline#slices#cwd()],
      \'y': [promptline#slices#git_status()],
      \'z': [promptline#slices#vcs_branch()],
      \'warn': [promptline#slices#last_exit_code()]}

let g:tex_flavor = 'latex'

let g:netrw_listhide = netrw_gitignore#Hide()
let g:netrw_liststyle = 3

let g:UltiSnipsExpandTrigger = "<c-j>"

" Mappings
" =================
nnoremap Q <Nop>

let mapleader=" "
nnoremap <leader>a :Snippets<CR>
nnoremap <leader>o :BCommits<CR>
nnoremap <leader>e :Commits<CR>
nnoremap <leader>u :Gblame<CR>
nnoremap <leader>i :Gdiff<CR>
nnoremap <leader>d :Lexplore<CR>
nnoremap <leader>h :Files<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>n :BTags<CR>
nnoremap <leader>s :ToggleWorkspace<CR>

" Autocommands
" =================
au! BufWritePost,BufEnter * Neomake
au! FileType c,cpp setl cinkeys-=0# cino=:g0
au! FileType python setl ts=4 sts=4 sw=4
