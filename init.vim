" vim: set foldmethod=marker foldlevel=0:
syntax on
filetype off
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" -----------------------------------------------------------------------
" Plugins {{{
" -----------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'JulesWang/css.vim' | Plug 'cakebaker/scss-syntax.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'bogado/file-line'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'chriskempson/base16-vim'
Plug 'duggiefresh/vim-easydir'
Plug 'elzr/vim-json'
Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
Plug 'honza/vim-snippets'
Plug 'joonty/vdebug'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'mattn/webapi-vim' | Plug 'urthbound/hound.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'svermeulen/vim-easyclip' | Plug 'tpope/vim-repeat'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive' | Plug 'tpope/vim-rhubarb'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'

call plug#end()

filetype plugin indent on

" }}}

" -----------------------------------------------------------------------
" Settings {{{
" -----------------------------------------------------------------------
let mapleader=' '

set autoindent
set autowrite
set autoread
if empty($SSH_CONNECTION) && has('clipboard')
  set clipboard^=unnamed                " Use vim global clipboard register
  if has('unnamedplus') || has('nvim')  " Use system clipboard register
    set clipboard^=unnamedplus
  endif
endif
set cursorline
set expandtab
set foldlevel=99
set hlsearch
set history=500
set incsearch
set ignorecase
set laststatus=2
set linebreak
set mouse=a
set nobackup
set noshowmode
set noswapfile
set writebackup
set number
set omnifunc=syntaxcomplete#Complete
set shiftwidth=4
set smartindent
set smartcase
set smarttab
set splitbelow
set splitright
set tabstop=4
set undodir=~/.vim/undodir
set undofile
set wildchar=<TAB>
set wildmenu
set wildmode=list:longest,full
set visualbell

" }}}

" -----------------------------------------------------------------------
" Autocommands  {{{
" -----------------------------------------------------------------------
" source vimrc when written
augroup SourceVIMRC
    autocmd!
    autocmd BufWritePost init.vim source $MYVIMRC
augroup END
" Open a History FZF view when opening Vim with no file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | History | endif
" Set good folding
autocmd FileType php,js,jsx,css,scss,tpl setl foldmethod=syntax
autocmd FileType php,js,jsx,css,scss,tpl setl foldlevel=2
" Remove extra whitespace
autocmd FileType php,js,jsx,css,scss,tpl,vim autocmd BufWritePre <buffer> %s/\s\+$//e

" }}}

" -----------------------------------------------------------------------
" Colorscheme {{{
" -----------------------------------------------------------------------
" +--------+--------+--------+--------+--------+--------+--------+--------+
" | grey 1 | grey 2 | grey 3 | grey 4 | grey 5 | grey 6 | grey 7 | grey 8 |
" |   00   |   10   |   11   |   08   |   12   |   07   |   13   |   15   |
" +--------+--------+--------+--------+--------+--------+--------+--------+
" |  red   | orange | yellow | green  |  teal  |  blue  | violet | brown  |
" |   01   |   09   |   03   |   02   |   06   |   04   |   05   |   14   |
" +--------+--------+--------+--------+--------+--------+--------+--------+
colorscheme base16-oceanicnext
highlight LineNr ctermfg=08 ctermbg=00
highlight SignColumn ctermbg=00
highlight VertSplit ctermbg=08 ctermfg=08
call matchadd('ColorColumn', '\%81v', 100)
highlight clear CursorLine
highlight CursorLineNR ctermbg=none
highlight clear SpellBad
highlight SpellBad cterm=undercurl ctermfg=01
highlight clear SpellCap
highlight SpellCap cterm=undercurl ctermfg=03
highlight DiffAdd ctermbg=02 ctermfg=00
highlight DiffChange ctermbg=09 ctermfg=00
highlight DiffDelete ctermbg=01 ctermfg=00

" }}}

" -----------------------------------------------------------------------
" Airline {{{
" -----------------------------------------------------------------------
let g:airline_theme='base16_oceanicnext'
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#ale#enabled=1
let g:airline#extensions#tabline#enabled=1
call airline#parts#define_raw('modified', '%{&modified ? "●" : ""}')
call airline#parts#define_accent('modified', 'blue')
let g:airline_section_b=''
let g:airline_section_c=airline#section#create(['modified', '%< %f'])
let g:airline_section_x=airline#section#create(['%l', ':', '%c'])
let g:airline_section_y=airline#section#create(['hunks', '%{fugitive#head()}'])
let g:airline_section_z=''

" }}}

" -----------------------------------------------------------------------
" Ale (linter) {{{
" -----------------------------------------------------------------------
highlight ALEErrorSign ctermbg=none ctermfg=01
highlight ALEWarningSign ctermbg=none ctermfg=03
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'php': ['phpcs'],
\}
let g:ale_sign_column_always = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '▲'
let g:ale_javascript_eslint_use_global=1
if getcwd()=~'/development/Etsyweb\(/\|$\)'
    let g:ale_javascript_eslint_use_global=1
    let g:ale_javascript_eslint_options='--config /home/jstewart/development/Etsyweb/htdocs/assets/js/mission_control/.eslintrc --env jasmine'
    let g:ale_php_phpcs_standard="/home/".expand($USER)."/development/Etsyweb/tests/standards/stable-ruleset.xml"
endif
let g:ale_lint_on_text_changed = 'never'

" }}}

" -----------------------------------------------------------------------
" Commenter {{{
" -----------------------------------------------------------------------
let g:NERDSpaceDelims=1
let g:NERDTrimTrailingWhitespace=1

" }}}

" -----------------------------------------------------------------------
" Deoplete {{{
" -----------------------------------------------------------------------
let g:deoplete#enable_at_startup = 1
let g:neosnippet#enable_snipmate_compatibility = 1

" }}}

" -----------------------------------------------------------------------
" Fugitive - Git {{{
" -----------------------------------------------------------------------
let g:github_enterprise_urls=['https://github.etsycorp.com']

" }}}

" -----------------------------------------------------------------------
" FZF - Fuzzy File {{{
" -----------------------------------------------------------------------
let g:fzf_colors={
    \ 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment']
    \}

" }}}

" -----------------------------------------------------------------------
" GitGutter {{{
" -----------------------------------------------------------------------
highlight GitGutterAdd ctermbg=00
highlight GitGutterChange ctermbg=00 ctermfg=3
highlight GitGutterDelete ctermbg=00
highlight GitGutterChangeDelete ctermbg=00 ctermfg=3
let g:gitgutter_sign_added='|'
let g:gitgutter_sign_modified='|'
let g:gitgutter_sign_removed_first_line='-'
let g:gitgutter_sign_modified_removed='|'
let g:gitgutter_diff_args='HEAD'

" }}}

" -----------------------------------------------------------------------
" Hound {{{
" -----------------------------------------------------------------------
let g:hound_base_url='hound.etsycorp.com'
let g:hound_port='6080'
let g:hound_repos='EtsyWeb'

" }}}

" -----------------------------------------------------------------------
" Indent guides {{{
" -----------------------------------------------------------------------
let g:indentLine_char='|'

" }}}

" -----------------------------------------------------------------------
" NERD Tree {{{
" -----------------------------------------------------------------------
let g:NERDTreeWinSize=60

" }}}

" -----------------------------------------------------------------------
" Syntax {{{
" -----------------------------------------------------------------------
" Markdown
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_conceal = 0

" }}}

" -----------------------------------------------------------------------
" Vdebug {{{
" -----------------------------------------------------------------------
let g:vdebug_options={}
let g:vdebug_options["break_on_open"]=0
let g:vdebug_options["timeout"]=40

" }}}

" -----------------------------------------------------------------------
" Mappings {{{
" -----------------------------------------------------------------------
" autocompletion
imap <C-x> <Plug>(neosnippet_expand_or_jump)
smap <C-x> <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
xmap <C-x> <Plug>(neosnippet_expand_target)
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" edit vimrc and apply changes
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" quicker esc
inoremap jk <esc>

" fuzzy search
command! -bar -bang -nargs=? -complete=dir FG call
    \ fzf#vim#files(
    \   '',
    \   {'options': '--query '. substitute(shellescape(<q-args>),
    \   '[\/,_]', ' ', 'g') .' -i'}
    \ )

" :Ag  - Start fzf with hidden preview window that can be enabled with '?' key
" :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* EAg
    \ call fzf#vim#ag(<q-args>, '--color-path "33;1" --ignore dist/ --ignore sandbox/',
    \     <bang>0 ? fzf#vim#with_preview('up:60%')
    \         : fzf#vim#with_preview('right:50%:hidden', '?'),
    \     <bang>0)

" search all files starting at current buffer path
noremap <C-t> :FG<cr>
" noremap <C-t> :FG <c-r>%<cr>

" search all file titles for word under cursor or selected
nnoremap <C-f> :FG <c-r><c-w><cr>
vnoremap <C-f> y :FG <C-R>"<CR>

" search all buffer titles
nnoremap <C-b> :Buffers<cr>

" search all buffer contents for word under cursor
nnoremap <C-c> :Lines <c-r><c-w><cr>

" search History
noremap <C-z> :History<cr>

" search all file contents for word under cursor or selected
nnoremap <C-a> :EAg! <c-r><c-w><cr>
vnoremap <C-a> y :EAg! <C-R>"<CR>

" search path completion in insert mode
imap <c-x><c-f> <plug>(fzf-complete-path)

" Show list of open windows and associated tabs
nnoremap <leader>w :Windows<cr>
nnoremap <c-g> :GFiles?<cr>

" git
command! Gst exe ':Gstatus'
command! Gb exe ':Gblame'

" save
nnoremap <leader>s :update<cr>

" quit
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :qa!<cr>

" navigate splits
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

" navigate tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" navigate buffers
nnoremap <C-Up> :bnext<CR>
nnoremap <C-Down> :bprev<CR>

" move lines
nnoremap <silent> <C-k> :move-2<cr>
nnoremap <silent> <C-j> :move+<cr>
nnoremap <silent> <C-h> <<
nnoremap <silent> <C-l> >>
xnoremap <silent> <C-k> :move-2<cr>gv
xnoremap <silent> <C-j> :move'>+<cr>gv
xnoremap <silent> <C-h> <gv
xnoremap <silent> <C-l> >gv

" unfold
nnoremap <Space> za
vnoremap <Space> za
nnoremap <leader>f :setlocal foldlevel=1 <bar> :setlocal foldmethod=indent<cr>

" move lines visually
noremap  <silent> k gk
noremap  <silent> j gj

" remap bookmark since m is now cut
nnoremap <leader>b m

" toggle comments easier
nnoremap <leader><leader> :call NERDComment(0,"toggle")<CR>
vnoremap <leader><leader> :call NERDComment(0,"toggle")<CR>

" gf setup
let &isfname="@,48-57,/,.,-,_,+,#,$,%,~"
set path+=~/development/Etsyweb/
set path+=~/development/Etsyweb/phplib/EtsyModel
set path+=~/development/Etsyweb/phplib
set path+=~/development/Etsyweb/templates/
set path+=~/development/Etsyweb/htdocs/assets/js/
set path+=~/development/Etsyweb/htdocs/
set path+=~/development/Etsyweb/tests/phpunit/
set path+=~/development/Etsyweb/tests/jsunit/tests/
set includeexpr=substitute(v:fname,'_','/','g')
set suffixesadd+=.php
set suffixesadd+=.tpl
set suffixesadd+=.mustache
set suffixesadd+=.js
set suffixesadd+=.jsx

" NerdTree
function! NerdTreeToggleOrPath()
    if (!exists('t:NERDTreeBufName') || bufwinnr(t:NERDTreeBufName) == -1) && &modifiable
        exe ':NERDTreeFind'
    else
        exe ':NERDTreeToggle'
    endif
endfunction
map <C-\> :call NerdTreeToggleOrPath()<CR>

" }}}
" <Leader>hs Stage hunk
" <Leader>hu Undo stage hunk
" ]c jump to next hunk (change)
" [c jump to previous hunk (change)

