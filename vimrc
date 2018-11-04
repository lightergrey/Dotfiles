syntax on

" -----------------------------------------------------------------------
" Plugins {{{
" -----------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'chriskempson/base16-vim'
Plug 'haya14busa/vim-poweryank'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'w0rp/ale'

call plug#end()

filetype plugin indent on

" }}}

" -----------------------------------------------------------------------
" Options {{{
" -----------------------------------------------------------------------
let mapleader=' '

set autoindent
set autoread
set backspace=indent,eol,start
if has('unnamedplus')
    set clipboard^=unnamedplus
endif
set complete-=i
set display+=lastline
set encoding=utf-8
set expandtab
set foldlevel=99
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set linebreak
set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set mouse=a
set nobackup
set noswapfile
set number
set relativenumber
set ruler
set scrolloff=5
set shiftwidth=4
set showtabline=2
set smartcase
set smartindent
set smarttab
set splitbelow
set splitright
set tabpagemax=50
set tabstop=4
set undodir=~/.vim/undodir
set undofile
set visualbell
set wildchar=<TAB>
set wildmenu
set wildmode=list:longest,full
set writebackup

" }}}

" -----------------------------------------------------------------------
" Autocommands  {{{
" -----------------------------------------------------------------------
" Remove extra whitespace
autocmd FileType php,js,jsx,css,scss,tpl,vim autocmd BufWritePre <buffer> %s/\s\+$//e
" Refresh buffer on focus
autocmd FocusGained,BufEnter * :silent! !
" Try relative numbers in normal mode and absolute in insert
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" }}}

" -----------------------------------------------------------------------
" Ale (linter) {{{
" -----------------------------------------------------------------------
let g:ale_fixers = { 'javascript': ['eslint'], }
let g:ale_linters = { 'javascript': ['eslint'], 'php': ['php'], }
let g:ale_sign_column_always = 1

" }}}

" -----------------------------------------------------------------------
" Colorscheme {{{
" -----------------------------------------------------------------------
call matchadd('ColorColumn', '\%81v', 100)
colorscheme base16-onedark

" -----------------------------------------------------------------------
" FZF - Fuzzy File {{{
" -----------------------------------------------------------------------
let g:fzf_buffers_jump = 1

" FZF Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" Fuzzy search in all files names in current directory
noremap <leader>f :Files<CR>
" Fuzzy search in all edited files names in current git directory
noremap <leader>g :GFiles?<CR>
" Fuzzy search in all files in current directory
noremap <leader>r :Rg<CR>
" Fuzzy search in all commands
noremap <leader>c :Commands<CR>

" }}}

" -----------------------------------------------------------------------
" Mappings {{{
" -----------------------------------------------------------------------

" Edit vimrc and apply changes
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Trim trailing whitespace
map <leader>ws :%s/\s\+$//e<CR>

" Yank selection from remote to local clipboard
map <leader>py <Plug>(operator-poweryank-osc52)

" Yank github url for current buffer from remote to local clipboard
map <leader>gy :redir @g<CR>:Gbrowse!<CR>:redir END<CR>:PowerYankOSC52 <C-R>g<CR>

" }}}
