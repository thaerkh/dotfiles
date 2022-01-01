" ~/.vimrc

" Plugins
" =================
if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')
" appearance
Plug 'edkolev/promptline.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/vim-clang-format'

" workspace
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'houtsnip/vim-emacscommandline'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree'
Plug 'simeji/winresizer'
Plug 'simnalamburt/vim-mundo'
Plug 'thaerkh/rainbow_parentheses.vim'
Plug 'thaerkh/vim-indentguides'
Plug 'thaerkh/vim-workspace'
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'hashivim/vim-terraform'

" Indexing
Plug 'tabnine/YouCompleteMe', {'do': 'python3 install.py --all'}
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" testing & linting
Plug 'janko-m/vim-test'
Plug 'w0rp/ale'

" git
Plug 'airblade/vim-gitgutter'
Plug 'octref/RootIgnore'

" tmux
Plug 'benmills/vimux'
Plug 'sjl/vitality.vim'

" languages & frameworks
Plug 'elixir-lang/vim-elixir'
Plug 'elzr/vim-json'
Plug 'fatih/vim-go'
Plug 'google/vim-jsonnet'
Plug 'honza/dockerfile.vim'
Plug 'hynek/vim-python-pep8-indent'
Plug 'lervag/vimtex'
Plug 'tmux-plugins/vim-tmux'
Plug 'tpope/vim-git'
call plug#end()

" Plugin Config
" =================
" appearance
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline_theme = 'term'
let g:jellybeans_overrides = {
      \'SignColumn': {'guibg': 'NONE'},
      \'CursorLine': {'guibg': 'NONE'},
      \'DiffChange': {'guifg': 'FFFF00'},
      \'DiffAdd': {'guifg': '00FF00'},
      \'DiffDelete': {'guifg': 'FF0000'}}
let g:jellybeans_use_term_background_color = 1
let g:promptline_preset = {
      \'a': [promptline#slices#cwd()],
      \'y': [promptline#slices#git_status()],
      \'z': [promptline#slices#vcs_branch()],
      \'warn': [promptline#slices#last_exit_code()]}

" workspace
let NERDTreeQuitOnOpen = 1
let NERDTreeRespectWildIgnore = 1
let g:indentguides_ignorelist = ['asciidoc', 'markdown', 'tex', 'text', '']
let g:rainbow#blacklist = [107, 179]
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
let g:workspace_session_disable_on_args = 1
let g:workspace_session_name = '.session.vim'

" indexing
let g:gutentags_ctags_exclude = ["*.json", "*.pdf", ".git", ".undodir", "*.md", "*.adoc", "*.wav", ".mp3", "*.png", "*.jpeg", "*.jpg", "*.gif"]
let g:gutentags_ctags_tagfile = '.tags'
let g:loaded_matchparen = 0

" testing & linting
let g:ale_emit_conflict_warnings = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let test#strategy = "vimux"

" git
let g:gitgutter_map_keys = 0

" tmux
let g:vitality_always_assume_iterm = 1

" languages & frameworks
let g:tex_flavor = 'latex'
let g:vim_json_syntax_conceal = 0

" Settings
" =================
filetype plugin indent on
syntax on

" environment behaviour
set autoread
set clipboard=unnamedplus
set complete-=i
set completeopt=longest,menuone,preview
set encoding=utf-8
set grepprg=ag
set ignorecase
set lazyredraw
set nocompatible
set noswapfile
set signcolumn=yes
set smartcase
set swapsync=""
set updatetime=500
set wildmenu
set wildmode=list:longest,full

" editor view
colorscheme jellybeans
set cursorline
set foldmethod=indent
set hidden
set incsearch
set laststatus=2
set linebreak
set list
set listchars=extends:>,precedes:<
set nofoldenable
set number
set ruler
set synmaxcol=4096

" editing behaviour
set autoindent
set backspace=indent,eol,start
set expandtab
set nofixeol
set nowrap
set shiftwidth=4
set smarttab
set tabstop=4
set textwidth=0

" Mappings
" =================
nnoremap <F2> :TestNearest<CR>
nnoremap <F3> :TestFile<CR>
nnoremap <F4> :call VimuxRunCommand('b <C-r>%:' . line('.'))<CR>

let mapleader      = " "
let maplocalleader = ","

" top row
nnoremap <leader>p :let @+ = expand('%')<CR>
nnoremap <leader>g :IndentGuidesToggle<CR>
nnoremap <leader>c :CloseHiddenBuffers<CR>
nnoremap <leader>r :execute 'silent !git reset ' . expand('%') \| redraw!<CR>
nnoremap <leader>l :execute 'silent !git add ' . expand('%') \| redraw!<CR>

" home row
nnoremap <leader>a  :Ag<CR>
xnoremap <leader>a  :EasyAlign<CR>
nnoremap <leader>o  :execute 'Ag ' . expand('<cword>')<CR>
nnoremap <leader>u  :MundoToggle<CR>
nnoremap <leader>D  :NERDTreeFind<CR>
nnoremap <leader>d  :NERDTreeToggle<CR>
nnoremap <leader>hp :GitGutterPreviewHunk<CR>
nnoremap <leader>hr :GitGutterUndoHunk<CR>
nnoremap <leader>ha :GitGutterStageHunk<CR>
nnoremap <leader>t  :Git difftool<CR>
nnoremap <leader>n  :Files<CR>
nnoremap <leader>s  :ToggleWorkspace<CR>

" bottom row
nnoremap <leader>q  :VimuxCloseRunner<CR>
nnoremap <leader>b  :Buffers<CR>
nnoremap <leader>m  :Git blame<CR>
nnoremap <leader>w  :Windows<CR>
nnoremap <leader>v  :Gclog<CR>

" misc
nnoremap [h :GitGutterPrevHunk<CR>
nnoremap ]h :GitGutterNextHunk<CR>
nnoremap Q  <Nop>

let g:winresizer_start_key   = "<C-n>"

" Autocommands
" =================
au! BufRead * source ~/.vim/colors/ale.vim
au! FileType * RainbowParentheses
au! FileType c,cpp setlocal cinoptions=(0,w1,g0,:0
au! FileType c,cpp ClangFormatAutoEnable
au! FileType asciidoc,gitcommit,markdown,tex,text setlocal spell
au! FileType qf nnoremap <buffer> q :call setqflist([])<CR>:q<CR>
au! QuickFixCmdPost * redraw!
