set nocompatible
syntax enable
filetype off

if !has('gui_running')
    set t_Co=256
endif
set termencoding=utf-8
set nonumber
"Let me erase with bakcspace at the end of the line
set backspace=indent,eol,start 
"Let me jump between unsaved buffers
set hidden


" Show invisible chars (tabs and EOL)
set listchars=tab:▸\ ,eol:¬
set list
set nocursorcolumn

set cursorline
set scrolloff=5
set smartcase
set ignorecase
set splitbelow
set splitright
set nowrap
set noshowmode

filetype plugin indent on
" Show existing tab with 3 spaces
set tabstop=3
" When indenting with '>' use tabs
set shiftwidth=3
" On pressing tab do not insert spaces
set noexpandtab

filetype plugin on
set omnifunc=syntaxcomplete#Complete

"vim/ctrlp ignore files
set wildignore+=*/tmp/*,*.beam,*/node_modules/*,*/deps/*

"Window Resizer settings
let g:winresizer_vert_resize = 5
let g:winresizer_horiz_resize = 1

"" Abbreviations
iabbrev adn and
iabbrev waht what

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|packages\|deps\|_build'


"Plugins {{{
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'itchyny/lightline.vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-unimpaired'

"Ctrlp -> seach files hitting C-p
Plugin 'ctrlpvim/ctrlp.vim'

<<<<<<< HEAD
=======
"completion
" C-n to select the next suggestion
" C-p to select the previous suggestion
" Plugin 'Shougo/deoplete.nvim'

>>>>>>> 894aad7ef1328bf61e0d01c72c0e446cd1e4f1a6
"git
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive'

"Javascript
Plugin 'pangloss/vim-javascript'

"Elixir
Plugin 'slashmili/Alchemist.vim'
Plugin 'elixir-editors/vim-elixir'
Plugin 'mhinz/vim-mix-format'

"Snipets
Plugin 'SirVer/ultisnips'
" C-j moves to next placeholder
" C-k moves to previous placeholder
Plugin 'honza/vim-snippets'

"Window management
Plugin 'szw/vim-maximizer' "Maximize window with <leader>m
Plugin 'simeji/winresizer' "Easy window resizing with <C-e> hjkl
"Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/BufOnly.vim'
Plugin 'christoomey/vim-tmux-navigator'

"Vue
" Plugin 'posva/vim-vue'
" Plugin 'leafOfTree/vim-vue-plugin'

"easy motion
Plugin 'easymotion/vim-easymotion'
"wakatime
Plugin 'wakatime/vim-wakatime'

" React
Plugin 'maxmellon/vim-jsx-pretty'

" Prettier
Plugin 'prettier/vim-prettier'

" tags
" Install universal ctags: https://github.com/universal-ctags/ctags#mac
Plugin 'ludovicchabant/vim-gutentags'

call vundle#end()            " required
filetype plugin indent on    " required
"}}}


" Plugin settings{{{
" Remap Ctrl-J to Ctrl-N to select next match on the completion list
inoremap <expr><c-j> pumvisible() ? "\<c-n>" : "\<c-j>"
" Remap Ctrl-K to Ctrl-P to select next match on the completion list
inoremap <expr><c-k> pumvisible() ? "\<c-p>" : "\<c-k>"
let g:mix_format_on_save = 1
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsSnippetDirectories=["~/dotfiles/snippets/"]
let g:prettier#autoformat_require_pragma = 0"
"markdown settings
let vim_markdown_preview_github=1
"Disable easymotion default mapings
let g:EasyMotion_do_mapping = 0 "
" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1
"}}}

" Mappings -------- {{{
let mapleader = ','
nnoremap <leader>v :tabe $MYVIMRC<cr>

nnoremap 0p "0p
nnoremap <leader><leader> <C-^>
nnoremap <space> :
nnoremap q<space> q:
"map space space to save file
nnoremap <space><space> :w<CR>
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>
" nnoremap <leader>d :bd <CR>
nnoremap <leader>d :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <leader>e :Explore<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
" nmap n nzz
" nmap N Nzz
"Fast window navigation
nnoremap <C-j> <C-W><C-j>
nnoremap <C-k> <C-W><C-k>
nnoremap <C-l> <C-W><C-l>
nnoremap <C-h> <C-W><C-h>
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
"Escape key in terminal emulator
tnoremap <Esc> <C-\><C-n>
"Window maximizer
nnoremap <leader>m :MaximizerToggle<CR>

"Move current line up or down
nmap <C-Up> [e
nmap <C-Down> ]e

"Move selected lines up or down
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Arrow keys
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>

"Easymotion mappings
nmap s <Plug>(easymotion-overwin-f)

inoremap <c-x><c-k> <c-x><c-k>

" inoremap <left> <nop>
" inoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
"}}}


"Autocmd commands {{{
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.less set filetype=less
autocmd BufRead,BufNewFile *.js,*.tsx,*.jsx set ft=javascript syntax=javascript
autocmd BufRead,BufNewFile *.json set ft=json syntax=javascript
autocmd BufRead,BufNewFile,BufEnter *.ex,*.exs set ft=elixir syntax=elixir
autocmd BufRead,BufNewFile *.leex,*.eex set ft=html.elixir
autocmd BufRead,BufNewFile *.cshtml set ft=html.razor
autocmd FileType elixir :iabbrev po \|>
"starts terminal in insert mode
autocmd BufWinEnter,WinEnter * if &buftype == 'terminal' | silent! normal i | endif
set foldlevelstart=20
augroup javascript_folding
    au!
    au FileType javascript,typescript setlocal foldmethod=syntax
	 au BufWritePre *.js,*.jsx,*.tsx :Prettier
    set shiftwidth=3
    setlocal expandtab
augroup END
augroup elixir_folding
    au!
    au FileType elixir setlocal foldmethod=syntax
augroup END
augroup html_folding
    au!
    au FileType html setlocal foldmethod=indent
augroup END
"}}}
"no expand tabs on make files
autocmd filetype make setlocal noexpandtab

"Windows settings {{{
"Use solarized dark
"set background=dark

if has('gui_running') && has('win32')
    set guifont=InputMono_Light:h10:cANSI:qDRAFT
    "remove gui toolbars and menus
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
endif
"}}}

" Vimscript file settings {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim set foldmethod=marker
augroup END
" }}}

" Text to show on Fold sections {{{
function! NeatFoldText()
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%5s", lines_count . ' lines') . ' |'
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()
" }}}

" Font used in terminal is InputMono 12pt Light
" http://input.fontbureau.com/download/
"Show always the status line
set laststatus=2
"Avoid delay when switching from insert mode to normal
set ttimeoutlen=50

set mouse=a
set hlsearch

" highline configuration {{{
let g:lightline = {
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], ['filenameshort' ], [ 'gitbranch' ] ],
    \   'right': [ [ 'lineinfo' ], [ 'filetype', 'fileencoding' ] ]
    \ },
    \ 'inactive' : {
    \   'left': [ [ 'mode', 'filenameshort', 'modified' ], [ 'gitbranch' ] ],
    \   'right': [ [ 'lineinfo' ],
    \            [ 'percent' ] ] 
    \ },
    \ 'tabline': {
    \   'left': [ [ 'tabs' ]],
    \ },
    \ 'enable': {'tabline': 1},
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head',
    \   'filenameshort': 'LightlineFilename'
    \ },
    \ }

" NERDTree
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>t :NERDTreeToggle<CR>

function! LightlineFilename()
    let filename = expand('%:t') !=# '' ? expand('%:t'): '[No Name]'
    let modified = &modified ? ' +': ''
    return filename . modified
endfunction

"}}}

"To link this file in windows:
"run `mklink /H ".vimrc" "dotfiles/vimrc`
"

"Set tree as the default view in netrw
let g:netrw_list_hide= '.*\.swp$,.*\.DS_Store'

" Gutentag settings
" How to gutentag identifies a new project folder
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['package.json', '.gitignore', '.git']
" When to generate the tags file
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
" What files/folders exclude from tag generation
let g:gutentags_ctags_exclude = [
	\ '*.git', '*.svg', '*.hg',
	\ '*/tests/*',
	\ 'build',
	\ 'dist',
	\ '*sites/*/files/*',
	\ 'bin',
	\ 'node_modules',
	\ 'bower_components',
	\ 'cache',
	\ 'compiled',
	\ 'docs',
	\ 'example',
	\ 'bundle',
	\ 'vendor',
	\ '*.md',
	\ '*-lock.json',
	\ '*.lock',
	\ '*bundle*.js',
	\ '*build*.js',
	\ '.*rc*',
	\ '*.json',
	\ '*.min.*',
	\ '*.map',
	\ '*.bak',
	\ '*.zip',
	\ '*.pyc',
	\ '*.class',
	\ '*.tmp',
	\ '*.cache',
	\ '*.pdb',
	\ 'tags*',
	\ '*.css',
	\ '*.less',
	\ '*.scss',
	\ '*.swp', '*.swo',
	\ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
	\ ]

"color solarized
set background=dark
highlight clear CursorLine
highlight CursorLine cterm=bold gui=bold
highlight clear SignColumn
highlight clear VertSplit
highlight VertSplit cterm=none gui=none
highlight Folded cterm=bold gui=bold
highlight NonText guifg=black ctermfg=black
highlight SpecialKey guifg=black ctermfg=black
highlight clear Search
highlight Search cterm=underline gui=underline


