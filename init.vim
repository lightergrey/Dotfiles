syntax on
filetype off

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
Plug 'chriskempson/base16-vim'
Plug 'duggiefresh/vim-easydir'
Plug 'elzr/vim-json'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'svermeulen/vim-easyclip' | Plug 'tpope/vim-repeat'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive' | Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'

call plug#end()

filetype plugin indent on

" }}}

" -----------------------------------------------------------------------
" Settings {{{
" -----------------------------------------------------------------------
let mapleader=' '

set autoindent
set autoread
set autowrite
set clipboard^=unnamedplus
set cursorline
set expandtab
set foldlevel=99
set history=500
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set linebreak
set mouse=a
set nobackup
set noshowmode
set noswapfile
set number
set omnifunc=syntaxcomplete#Complete
set relativenumber
set scrolloff=5
set shiftwidth=4
set shortmess+=I
set showtabline=0
set smartcase
set smartindent
set smarttab
set splitbelow
set splitright
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
" source vimrc when written
augroup SourceVIMRC
    autocmd!
    autocmd BufWritePost init.vim source $MYVIMRC
augroup END
" Close NERDTree if it is the last open buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Set good folding
autocmd FileType php,js,jsx,css,scss,tpl setl foldmethod=syntax
autocmd FileType php,js,jsx,css,scss,tpl setl foldlevel=2
" Remove extra whitespace
autocmd FileType php,js,jsx,css,scss,tpl,vim autocmd BufWritePre <buffer> %s/\s\+$//e
" Refresh buffer on focus
autocmd FocusGained,BufEnter * :silent! !
" Try relative numbers in normal mode and absolute in insert
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

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
highlight LineNr ctermfg=11 ctermbg=00
highlight SignColumn ctermbg=00
highlight VertSplit ctermbg=10 ctermfg=10
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
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#ale#enabled=1
let g:airline#extensions#tabline#enabled=0

" }}}

" -----------------------------------------------------------------------
" Ale (linter) {{{
" -----------------------------------------------------------------------
highlight ALEErrorSign ctermbg=none ctermfg=01
highlight ALEWarningSign ctermbg=none ctermfg=03
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
let g:ale_sign_column_always = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '▲'
let g:ale_javascript_eslint_use_global=1
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}

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
let g:deoplete#auto_complete_delay = 1
let g:deoplete#min_pattern_length = 1
let g:deoplete#sources#ternjs#filetypes = [
    \ 'jsx',
    \ 'javascript.jsx',
    \ ]

" }}}

" ----------------------------------------------------------------------
" EasyClip {{{
" ----------------------------------------------------------------------
let g:EasyClipUsePasteDefaults = 0
let g:EasyClipShareYanks = 1
let g:EasyClipUsePasteToggleDefaults = 0
let g:EasyClipUseCutDefaults = 0

" }}}

" -----------------------------------------------------------------------
" FZF - Fuzzy File {{{
" -----------------------------------------------------------------------
let g:fzf_colors={
    \ 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'Normal'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', '03'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment']
    \}
let g:fzf_buffers_jump = 1

function! s:fzf_statusline()
    highlight fzf1 ctermfg=00 ctermbg=11
    highlight fzf2 ctermfg=00 ctermbg=11
    highlight fzf3 ctermfg=00 ctermbg=11
    setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

" }}}

" -----------------------------------------------------------------------
" gf {{{
" -----------------------------------------------------------------------
let &isfname="@,48-57,/,.,-,_,+,#,$,%,~"
set includeexpr=substitute(v:fname,'_','/','g')
set suffixesadd+=.php
set suffixesadd+=.tpl
set suffixesadd+=.mustache
set suffixesadd+=.js
set suffixesadd+=.jsx

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
" Indent guides {{{
" -----------------------------------------------------------------------
let g:indentLine_char='|'

" }}}

" -----------------------------------------------------------------------
" Neoformat {{{
" -----------------------------------------------------------------------
let g:neoformat_javascript_prettier = {
    \ 'exe': 'prettier',
    \ 'args': ['--stdin', '--tab-width=4'],
    \ 'stdin': 1,
    \ }

let g:neoformat_enabled_javascript = ['prettier']

" }}}

" -----------------------------------------------------------------------
" NERD Tree {{{
" -----------------------------------------------------------------------
let g:NERDTreeWinSize=60

" }}}

" -----------------------------------------------------------------------
" Syntax {{{
" -----------------------------------------------------------------------
let g:vim_json_syntax_conceal = 0

" }}}

" -----------------------------------------------------------------------
" Mappings {{{
" -----------------------------------------------------------------------
" autocompletion
imap <expr><TAB>
    \ pumvisible()
    \     ? "\<C-n>"
    \     : neosnippet#expandable_or_jumpable()
    \         ? "\<Plug>(neosnippet_expand_or_jump)"
    \         : "\<TAB>"

imap <expr><S-TAB>
    \ pumvisible()
    \     ? "\<C-p>"
    \     : "\<S-TAB>"

inoremap <expr><CR>
    \ pumvisible()
    \     ? deoplete#mappings#close_popup()
    \     : "\<CR>"

" Edit vimrc and apply changes
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

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

" Fuzzy search in all tags
noremap <leader>t :Tags<CR>
" Fuzzy search for word under cursor in all tags
nnoremap <leader>tt :Tags <C-R><C-W><CR>
" Fuzzy search for selected in all tags
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

" Move lines
nnoremap <silent> <C-K> :move-2<CR>
nnoremap <silent> <C-J> :move+<CR>
nnoremap <silent> <C-H> <<
nnoremap <silent> <C-L> >>
xnoremap <silent> <C-K> :move-2<CR>gv
xnoremap <silent> <C-J> :move'>+<CR>gv
xnoremap <silent> <C-H> <gv
xnoremap <silent> <C-L> >gv

" Toggle comments
noremap <leader><leader> :call NERDComment(0,"toggle")<CR>

" Show buffer in NerdTree or toggle
function! NerdTreeToggleOrPath()
    if (!exists('t:NERDTreeBufName') || bufwinnr(t:NERDTreeBufName) == -1) && &modifiable
        exe ':NERDTreeFind'
    else
        exe ':NERDTreeToggle'
    endif
endfunction
map <C-\> :call NerdTreeToggleOrPath()<CR>

" Change two vertically split windows to horizonally split
map <leader>vh <C-W>t<C-W>K

" Change two horizonally split windows to vertically split
map <leader>hv <C-W>t<C-W>H

" Cut selection or line
nmap <leader>y <Plug>MoveMotionPlug
xmap <leader>y <Plug>MoveMotionXPlug
nmap <leader>yy <Plug>MoveMotionLinePlug

" Trim trailing whitespace
map <leader>ws :%s/\s\+$//e<CR>

" Toggle between relative and absolute numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

nnoremap <leader># :call NumberToggle()<cr>

" ***
" Maybe get rid of these?
" ***

" Save
" nnoremap <leader>s :update<CR>

" Quit
" nnoremap <leader>q :q<CR>
" nnoremap <leader>Q :qa!<CR>

" Quicker esc
inoremap jk <esc>
vnoremap jk <esc>

" Unfold
" nnoremap <leader> za
" vnoremap <leader> za

" Maybe an ok folding setup?
" nnoremap <leader>fa :setlocal foldlevel=1 <bar> :setlocal foldmethod=syntax<CR>

" Move lines visually
" noremap <silent> k gk
" noremap <silent> j gj

" }}}

" -----------------------------------------------------------------------
" HardMode {{{
" -----------------------------------------------------------------------
fun! HardMode()
    set backspace=0

    nnoremap <buffer> <Left> <Esc>:echo('No arrow keys.')<CR>
    nnoremap <buffer> <Right> <Esc>:echo('No arrow keys.')<CR>
    nnoremap <buffer> <Up> <Esc>:echo('No arrow keys.')<CR>
    nnoremap <buffer> <Down> <Esc>:echo('No arrow keys.')<CR>
    nnoremap <buffer> <PageDown> <Esc>:echo('No arrow keys.')<CR>

    inoremap <buffer> <Left> <Esc>:echo('No arrow keys.')<CR>
    inoremap <buffer> <Right> <Esc>:echo('No arrow keys.')<CR>
    inoremap <buffer> <Up> <Esc>:echo('No arrow keys.')<CR>
    inoremap <buffer> <Down> <Esc>:echo('No arrow keys.')<CR>
    inoremap <buffer> <PageUp> <Esc>:echo('No arrow keys.')<CR>
    inoremap <buffer> <PageDown> <Esc>:echo('No arrow keys.')<CR>

    vnoremap <buffer> <Left> <Esc>:echo('No arrow keys.')<CR>
    vnoremap <buffer> <Right> <Esc>:echo('No arrow keys.')<CR>
    vnoremap <buffer> <Up> <Esc>:echo('No arrow keys.')<CR>
    vnoremap <buffer> <Down> <Esc>:echo('No arrow keys.')<CR>
    vnoremap <buffer> <PageUp> <Esc>:echo('No arrow keys.')<CR>
    vnoremap <buffer> <PageDown> <Esc>:echo('No arrow keys.')<CR>
endfun

fun! EasyMode()
    set backspace=indent,eol,start

    silent! nunmap <buffer> <Left>
    silent! nunmap <buffer> <Right>
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <PageUp>
    silent! nunmap <buffer> <PageDown>

    silent! iunmap <buffer> <Left>
    silent! iunmap <buffer> <Right>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <PageUp>
    silent! iunmap <buffer> <PageDown>

    silent! vunmap <buffer> <Left>
    silent! vunmap <buffer> <Right>
    silent! vunmap <buffer> <Up>
    silent! vunmap <buffer> <Down>
    silent! vunmap <buffer> <PageUp>
    silent! vunmap <buffer> <PageDown>
endfun

" }}}

" -----------------------------------------------------------------------
" Notes {{{
" -----------------------------------------------------------------------
" http://vim.wikia.com/wiki/All_the_right_moves

" zM            - Close all folds
" zm            - fold level by level
" zR            - Open all folds
" zr            - Open level by level

" gt            - tab next
" gT            - tabprevious

" gf            - Edit existing file under cursor in same window
" C-Wf          - Edit existing file under cursor in split window
" C-Wgf         - Edit existing file under cursor in new tabpage

" <Leader>hs    - Stage hunk
" <Leader>hu    - Undo stage hunk
" ]c            - jump to next hunk (change)
" [c            - jump to previous hunk (change)

" }}}

