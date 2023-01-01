" ~/.vimrc

" ==== Plugins ====

if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')
" appearance
Plug 'edkolev/promptline.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'thaerkh/rainbow_parentheses.vim'
Plug 'thaerkh/vim-indentguides'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" workspace
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'benmills/vimux'
Plug 'houtsnip/vim-emacscommandline'
Plug 'junegunn/vim-easy-align'
Plug 'octref/RootIgnore'
Plug 'scrooloose/nerdtree'
Plug 'simnalamburt/vim-mundo'
Plug 'thaerkh/vim-workspace'
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-sleuth'
Plug 'vim-autoformat/vim-autoformat'

" Indexing
Plug 'tabnine/YouCompleteMe', {'do': 'python3 install.py --all'}
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'

" testing & linting
Plug 'janko-m/vim-test'
Plug 'w0rp/ale'

" languages & frameworks
Plug 'aklt/plantuml-syntax'
Plug 'elixir-lang/vim-elixir'
Plug 'google/vim-jsonnet'
Plug 'hashivim/vim-terraform'
Plug 'hynek/vim-python-pep8-indent'
call plug#end()

" ==== Settings ====

set autoindent
set autoread
set backspace=indent,eol,start
set cinoptions=(0,w1,g0,:0
set colorcolumn=100
set clipboard=unnamedplus
set complete-=i
set completeopt=longest,menuone,preview
set cursorline
set encoding=utf-8
set expandtab
set foldmethod=indent
set hidden
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set linebreak
set list
set listchars=extends:>,precedes:<
set mouse=a
set nocompatible
set nofixeol
set nofoldenable
set noswapfile
set nowrap
set number
set ruler
set signcolumn=yes
set smartcase
set smartindent
set smarttab
set swapsync=""
set synmaxcol=4096
set textwidth=0
set wildmenu
set wildmode=list:longest,full

let &grepprg='rg --smart-case --vimgrep'

let NERDTreeQuitOnOpen = 1
let NERDTreeRespectWildIgnore = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline_theme = 'term'
let g:loaded_matchparen = 0
let g:promptline_preset = {
      \'a': [promptline#slices#cwd({'dir_limit': 1})],
      \'b': [promptline#slices#vcs_branch(), promptline#slices#git_status()],
      \'warn' : [promptline#slices#last_exit_code(), promptline#slices#battery()]}
let g:vim_json_conceal = 0
let g:vitality_always_assume_iterm = 1
let g:workspace_session_disable_on_args = 1
let g:ycm_show_diagnostics_ui = 0
let test#strategy = "vimux"

filetype plugin indent on
syntax on
colorscheme jellybeans

highlight! NonText ctermbg=NONE
highlight! LineNr ctermbg=NONE
highlight! Normal ctermbg=NONE
highlight! ColorColumn ctermbg=232
highlight! SignColumn ctermbg=NONE
highlight! CursorLine ctermbg=NONE
highlight! ALEErrorSign ctermfg=darkred ctermbg=NONE
highlight! ALEWarningSign ctermfg=darkyellow ctermbg=NONE
highlight! GitGutterChange ctermfg=yellow ctermbg=NONE
highlight! GitGutterAdd ctermfg=green ctermbg=NONE
highlight! GitGutterDelete ctermfg=red ctermbg=NONE

autocmd! FileType * RainbowParentheses
autocmd! FileType asciidoc,gitcommit,markdown,tex,text setlocal spell

" ==== Mappings ====

let mapleader      = " "
let maplocalleader = ","

" top row
nnoremap <leader>p  :let @+ = expand('%')<CR>
nnoremap <leader>f  :Autoformat<CR>
nnoremap <leader>c  :CloseHiddenBuffers<CR>
nnoremap <leader>gc :execute 'silent !git checkout ' . expand('%') \| redraw!<CR>
nnoremap <leader>gr :execute 'silent !git reset ' . expand('%') \| redraw!<CR>
nnoremap <leader>ga :execute 'silent !git add ' . expand('%') \| redraw!<CR>

" home row
nnoremap <leader>a  :Rg<CR>
xnoremap <leader>a  :EasyAlign<CR>
nnoremap <leader>o  :execute 'Rg ' . expand('<cword>')<CR>
nnoremap <leader>u  :MundoToggle<CR>
nnoremap <leader>D  :NERDTreeFind<CR>
nnoremap <leader>d  :NERDTreeToggle<CR>
nnoremap <leader>t  :Tags '<C-r><C-w><CR>
nnoremap <leader>n  :Files<CR>
nnoremap <leader>s  :ToggleWorkspace<CR>

" bottom row
nnoremap <leader>q  :call setqflist([])<CR>
nnoremap <leader>m  :call VimuxRunCommand('tig blame ' . expand('%'))<CR>
nnoremap <leader>b  :Buffers<CR>
nnoremap <leader>w  :Windows<CR>
