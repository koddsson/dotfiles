" Set leader key to `,`
let mapleader = ","

" Open the fuzzy finder with ,p
map <leader>p :FZF<CR>

" Open up notes with ,m
map <leader>m :tabnew ~/.notes.txt<CR>

" Don't know what this is.
let g:fzf_buffers_jump = 1

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" The best way to find files
" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run install script
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  " Both options are optional. You don't have to install fzf in ~/.fzf
  " and you don't have to run install script if you use fzf only in Vim.

" The cool line at the bottom
Plug 'itchyny/lightline.vim'

" For node plugings
Plug 'neovim/node-host', { 'do': 'npm install -g neovim' }

" Linting and formatting
Plug 'w0rp/ale'

" Solarized
Plug 'altercation/vim-colors-solarized'

" Git & GitHub
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" cs'" to replace ' with ", ds' to remove '
Plug 'tpope/vim-surround'

" For repeating plugin commands
Plug 'tpope/vim-repeat'

" To make emojis render correctly
Plug 'junegunn/vim-emoji'

" Access the terminal with `:Term`
Plug 'mklabs/split-term.vim'

" Languages and syntaxes
Plug 'leafgarland/typescript-vim'

" Grepping
Plug 'numkil/ag.nvim'

" Dash integration
Plug 'rizzatti/dash.vim'

" Dependency version info
Plug 'meain/vim-package-info', { 'do': 'npm install' }

" :Goyo for zen mode
Plug 'junegunn/goyo.vim'

" Like it says on the tin, markdown preview.
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }

" `g c` to comment and uncomment lines
Plug 'tpope/vim-commentary'

" Initialize plugin system
call plug#end()

" Don't display `-- INSERT --` when in insert mode, since airline does that
" already.
set noshowmode

" Solarized theme and syntax highlighting with line numbers
syntax enable
set background=light
colorscheme solarized
set number

" Set ALE linters and fixes.
let g:ale_linters = {
\   'ruby': ['rubocop', 'trim_whitespace'],
\   'typescript': ['eslint', 'prettier', 'prettier-eslint', 'standard'],
\   'javascript': ['eslint', 'flow', 'prettier', 'prettier-eslint', 'standard'],
\}
let g:ale_fixers = {
\   'ruby': ['rubocop', 'trim_whitespace'],
\   'typescript': ['eslint', 'prettier', 'prettier-eslint', 'standard'],
\   'javascript': ['eslint', 'prettier', 'prettier-eslint', 'standard'],
\}
let g:ale_linter_aliases = {
\   'typescript': ['javascript']
\}

let g:ale_fix_on_save = 1

" I really don't know what this does
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab
" Speling is good
set spell

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Yank to system clipboard
set clipboard=unnamedplus

" Show full filename in lightline
let g:lightline = {
      \ 'component': {
      \   'filename': '%F',
      \ }
      \ }
