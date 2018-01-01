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

" workspace
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'easymotion/vim-easymotion'
Plug 'houtsnip/vim-emacscommandline'
Plug 'metakirby5/codi.vim'
Plug 'scrooloose/nerdtree'
Plug 'simeji/winresizer'
Plug 'thaerkh/rainbow_parentheses.vim'
Plug 'thaerkh/vim-indentguides'
Plug 'thaerkh/vim-workspace'
Plug 'tpope/vim-sleuth'
Plug 'yuttie/comfortable-motion.vim'

" indexing
Plug 'davidhalter/jedi-vim'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mileszs/ack.vim'

" testing & linting
Plug 'janko-m/vim-test'
Plug 'w0rp/ale'

" macros
Plug 'Shougo/neocomplete.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'roxma/vim-paste-easy'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'

" git
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'
Plug 'octref/RootIgnore'
Plug 'tpope/vim-fugitive'

" tmux
Plug 'benmills/vimux'
Plug 'sjl/vitality.vim'
Plug 'tmux-plugins/vim-tmux'

" languages & frameworks
Plug 'JuliaEditorSupport/julia-vim'
Plug 'derekwyatt/vim-scala'
Plug 'elixir-lang/vim-elixir'
Plug 'elzr/vim-json'
Plug 'fatih/vim-go'
Plug 'honza/dockerfile.vim'
Plug 'hynek/vim-python-pep8-indent'
Plug 'jalvesaq/Nvim-R'
Plug 'lervag/vimtex'
Plug 'mxw/vim-jsx'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-git'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
call plug#end()

let g:ackprg = 'ag --vimgrep'

let g:ale_emit_conflict_warnings = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'

let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline_theme = 'term'

let g:EasyMotion_do_mapping = 0

let g:gitgutter_map_keys = 0
set signcolumn=yes

let g:indentguides_ignorelist = ['text', '']

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

let g:jellybeans_overrides = {
      \'SignColumn': {'guibg': '121212'},
      \'CursorLine': {'guibg': 'NONE'}}

let g:jsx_ext_required = 0

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

let NERDTreeQuitOnOpen = 1
let NERDTreeRespectWildIgnore = 1

let g:paste_char_threshold = 2

let g:promptline_preset = {
      \'a': [promptline#slices#cwd()],
      \'y': [promptline#slices#git_status()],
      \'z': [promptline#slices#vcs_branch()],
      \'warn': [promptline#slices#last_exit_code()]}

let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
let g:rainbow#blacklist = [107, 179]

let test#strategy = "vimux"

let g:tex_flavor = 'latex'

let g:vim_json_syntax_conceal = 0

let g:vitality_always_assume_iterm = 1

let g:workspace_session_disable_on_args = 1

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
set lazyredraw
set nocompatible
set noswapfile
set path+=**
set swapsync=""
set updatetime=1000
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
set nowrap
set shiftwidth=4
set smarttab
set tabstop=4
set textwidth=0

" Mappings
" =================
nnoremap <F2> :TestNearest<CR>
nnoremap <F3> :TestFile<CR>
nnoremap <F4> :TestLast<CR>
nnoremap <F5> :TestSuite<CR>
nnoremap <F6> :TestVisit<CR>

noremap ; :

let mapleader      = " "
let maplocalleader = ","

" num row
nnoremap <leader><C-]> <C-w><C-]><C-w>T
nnoremap <leader>]     <C-w>v<C-]>

" top row
nnoremap <leader>f <C-w>f<C-w>H
nnoremap <leader>g :IndentGuidesToggle<CR>
nnoremap <leader>c :CloseHiddenBuffers<CR>
nnoremap <leader>l :set hlsearch!<CR>

" home row
nnoremap <leader>a  :Ack!<CR>
nnoremap <leader>o  :AckFromSearch!<CR>
nnoremap <leader>e  :Ag<CR>
nnoremap <leader>D  :NERDTreeFind<CR>
nnoremap <leader>d  :NERDTreeToggle<CR>
nnoremap <leader>hp :GitGutterPreviewHunk<CR>
nnoremap <leader>hr :GitGutterUndoHunk<CR>
nnoremap <leader>ha :GitGutterStageHunk<CR>
nnoremap <leader>t  :Tags<CR>
nnoremap <leader>s  :ToggleWorkspace<CR>

" bottom row
map      <leader>j  <Plug>(easymotion-w)
map      <leader>k  <Plug>(easymotion-b)
nnoremap <leader>b  :Buffers<CR>
nnoremap <leader>m  :Gblame<CR>
nnoremap <leader>n  :Files<CR>
nnoremap <leader>w  :Windows<CR>
nnoremap <leader>v  :GV!<CR>
nnoremap <leader>zb :b #<CR>:bd #<CR>
nnoremap <leader>zq :call setqflist([])<CR>
nnoremap <leader>zt :tabclose<CR>

" misc
nnoremap [b :bprev<CR>
nnoremap ]b :bnext<CR>
nnoremap [e :cprev<CR>zz
nnoremap ]e :cnext<CR>zz
nnoremap [. :lprev<CR>zz
nnoremap ]. :lnext<CR>zz
nnoremap [h :GitGutterPrevHunk<CR>zz
nnoremap ]h :GitGutterNextHunk<CR>zz
nnoremap cp :let @+ = expand('%')<CR>
nnoremap ga :EasyAlign<CR>
xnoremap ga :EasyAlign<CR>
nnoremap Q  <Nop>

let g:UltiSnipsExpandTrigger = "<C-j>"
let g:winresizer_start_key   = "<C-n>"

" Autocommands
" =================
au! BufRead * source ~/.vim/colors/ale.vim
au! FileType * RainbowParentheses
au! FileType markdown,gitcommiti,tex setlocal spell
au! FileType javascript setlocal foldmethod=syntax
au! QuickFixCmdPost * redraw!
