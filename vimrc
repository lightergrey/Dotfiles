syntax on

" -----------------------------------------------------------------------
" Plugins {{{
" -----------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'duggiefresh/vim-easydir'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/vim-poweryank'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mustache/vim-mustache-handlebars'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
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
set conceallevel=0
set display+=lastline
set encoding=utf-8
set expandtab
set foldlevel=99
set formatoptions+=j
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
" Source vimrc when saved
augroup SourceVIMRC
    autocmd!
    autocmd BufWritePost .vimrc source $MYVIMRC
augroup END
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
let g:ale_sign_error = '●'
let g:ale_sign_warning = '▲'

" }}}

" -----------------------------------------------------------------------
" Colorscheme {{{
" -----------------------------------------------------------------------
call matchadd('ColorColumn', '\%81v', 100)
colorscheme base16-oceanicnext
highlight CursorLineNR ctermbg=black
highlight GitGutterAdd ctermbg=black
highlight GitGutterChange ctermbg=black
highlight GitGutterChangeDelete ctermbg=black
highlight GitGutterDelete ctermbg=black
highlight LineNr ctermbg=black ctermfg=11
highlight SignColumn ctermbg=black

" }}}

" -----------------------------------------------------------------------
" FZF - Fuzzy File {{{
" -----------------------------------------------------------------------
let g:fzf_buffers_jump = 1

" FZF Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" FZF Insert mode completion
imap <C-X><C-K> <plug>(fzf-complete-word)
imap <C-X><C-F> <plug>(fzf-complete-path)
imap <C-X><C-J> <plug>(fzf-complete-file-ag)
imap <C-X><C-L> <plug>(fzf-complete-line)

function! CleanWord(word)
    return substitute(
        \    shellescape(a:word),
        \    '[\/,_]',
        \    ' ',
        \    'g'
        \ )
endfunction

" :Files - Start fzf searching files
command! -bar -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(
    \   '',
    \   {'options': '--query '. CleanWord(<q-args>) .' -i'}
    \ )

" :Rg  - Start fzf with hidden preview window that can be enabled with '?' key
" :Rg! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always  --glob "!build/*" --glob "!dist/*" --glob "!sandbox/*" '.shellescape(<q-args>), 1,
    \   <bang>0 ? fzf#vim#with_preview('up:40%')
    \           : fzf#vim#with_preview('right:50%:hidden', '?'),
    \   <bang>0)

" Fuzzy search in all files names in current directory
noremap <leader>f :Files<CR>
" Fuzzy search for word under cursor in all files names in current directory
nnoremap <leader>ff :Files <C-R><C-W><CR>
" Fuzzy search for selected in all files names in current directory
vnoremap <leader>ff y :Files <C-R>"<CR>

" Fuzzy search in all files names in current buffer's directory
nnoremap <leader>p :Files %:h<CR>

" Fuzzy search in all open buffer lines
noremap <leader>l :Lines<CR>
" Fuzzy search for word under cursor in all open buffer lines
nnoremap <leader>ll :Lines <C-R><C-W><CR>
" Fuzzy search for selected  in all open buffer lines
vnoremap <leader>ll y :Lines <C-R>"<CR>

" Fuzzy search in all files in current directory
noremap <leader>r :Rg<CR>
" Fuzzy search for word under cursor in all files in current directory
nnoremap <leader>rr :Rg <C-R><C-W><CR>
" Fuzzy search for selected in all files in current directory
vnoremap <leader>rr y :Rg <C-R>"<CR>

" Fuzzy search in tags
noremap <leader>t :Tags<CR>
" Fuzzy search for word under cursor in tags
nnoremap <leader>tt :Tags <C-R><C-W><CR>
" Fuzzy search for selected in tags
vnoremap <leader>tt y :Tags <C-R>"<CR>

" Fuzzy search in all files names in history
noremap <leader>h :History<CR>
" Fuzzy search in all open buffer names
noremap <leader>b :Buffers<CR>
" Fuzzy search in all window buffer names
noremap <leader>w :Windows<CR>
" Fuzzy search in all changed file names
noremap <leader>g :GFiles?<CR>
" Fuzzy search in all Help docs
noremap <leader>? :Helptags<CR>
" Fuzzy search in all commands
noremap <leader>c :Commands<CR>

" }}}

" -----------------------------------------------------------------------
" GitGutter {{{
" -----------------------------------------------------------------------
let g:gitgutter_sign_added='|'
let g:gitgutter_sign_modified='|'
let g:gitgutter_sign_removed_first_line='-'
let g:gitgutter_sign_modified_removed='|'
let g:gitgutter_diff_args='HEAD'

nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
omap ih <Plug>GitGutterTextObjectInnerPending
omap ah <Plug>GitGutterTextObjectOuterPending
xmap ih <Plug>GitGutterTextObjectInnerVisual
xmap ah <Plug>GitGutterTextObjectOuterVisual

" }}}

" -----------------------------------------------------------------------
" Incsearch {{{
" -----------------------------------------------------------------------
let g:incsearch#auto_nohlsearch = 1

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" }}}

" -----------------------------------------------------------------------
" Indent Line {{{
" -----------------------------------------------------------------------
let g:indentLine_setColors = 1
let g:indentLine_enabled = 0

" }}}

" -----------------------------------------------------------------------
" Mappings {{{
" -----------------------------------------------------------------------
" autocompletion
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" Edit vimrc and apply changes
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Change two vertically split windows to horizonally split
map <leader>vh <C-W>t<C-W>K

" Change two horizonally split windows to vertically split
map <leader>hv <C-W>t<C-W>H

" Trim trailing whitespace
map <leader>ws :%s/\s\+$//e<CR>

" Yank selection from remote to local clipboard
map <leader>py <Plug>(operator-poweryank-osc52)

" Yank github url for current buffer from remote to local clipboard
map <leader>gy :redir @g<CR>:Gbrowse!<CR>:redir END<CR>:PowerYankOSC52 <C-R>g<CR>

" }}}
