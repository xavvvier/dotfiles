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

highlight clear SignColumn
highlight CursorLine cterm=NONE ctermbg=black guibg=#101520
set nocursorcolumn
set cursorline
set tabstop=3
set shiftwidth=3
set expandtab
set softtabstop=3
set scrolloff=5
set smartcase
set nowrap

"User solarized dark
set background=dark

filetype plugin on

"vim/ctrlp ignore files
set wildignore+=*/tmp/*,*.beam

"Supertab 
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
"let g:SuperTabContextDefaultCompletionType = "context"

"Window Resizer settings
let g:winresizer_vert_resize = 5
let g:winresizer_horiz_resize = 1

"" Abbreviations
iabbrev adn and
iabbrev waht what

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|packages'

"Plugins {{{
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'itchyny/lightline.vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-unimpaired'
Plugin 'jiangmiao/auto-pairs'

"Ctrlp -> seach files hitting C-p
Plugin 'ctrlpvim/ctrlp.vim'

"git
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive'

"Javascript
"Plugin 'pangloss/vim-javascript'
"Plugin 'jelera/vim-javascript-syntax'
"Omnicompletion with tab
Plugin 'ervandew/supertab'

"Elixir
Plugin 'slashmili/Alchemist.vim'
Plugin 'elixir-editors/vim-elixir'
Plugin 'mmorearty/elixir-ctags'

"Snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

"Window management
Plugin 'szw/vim-maximizer' "Maximize window with <leader>m
Plugin 'simeji/winresizer' "Easy window resizing with <C-e> hjkl
Plugin 'altercation/vim-colors-solarized'

"wakatime
Plugin 'wakatime/vim-wakatime'
call vundle#end()            " required
filetype plugin indent on    " required
"}}}

" Mappings -------- {{{
let mapleader = ','
nnoremap <leader>v :vsp $MYVIMRC<cr>
nnoremap <leader>sv :so $MYVIMRC<cr>

nnoremap 0p "0p
nnoremap <leader><leader> <C-^>
nnoremap <space> :
nnoremap q<space> q:
"map space space to save file
nnoremap <space><space> :w<CR>
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>
nnoremap <leader>d :bp \| bd #<CR>
nnoremap <leader>e :Explore<CR>
nmap n nzz
nmap N Nzz
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

" Arrow keys
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>

" inoremap <left> <nop>
" inoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
"}}}


"Autocmd commands {{{
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.less set filetype=less
autocmd BufRead,BufNewFile *.js set ft=javascript syntax=javascript
autocmd BufRead,BufNewFile *.json set ft=json syntax=javascript
autocmd BufRead,BufNewFile,BufEnter *.ex,*.exs set ft=elixir syntax=elixir
autocmd BufRead,BufNewFile *.eex set ft=html.elixir
autocmd FileType elixir :iabbrev po \|>
"starts terminal in insert mode
autocmd BufWinEnter,WinEnter * if &buftype == 'terminal' | silent! normal i | endif
"}}}

"Windows settings {{{
colorscheme solarized
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

" Folding setting {{{
hi Folded cterm=NONE
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
hi VertSplit ctermbg=none  guifg=black guibg=black cterm=NONE gui=NONE
set hlsearch
hi Search ctermbg=gray ctermfg=17

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
    \   'right': [ [ 'close' ]]
    \ },
    \ 'enable': {'tabline': 1},
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head',
    \   'filenameshort': 'LightlineFilename'
    \ },
    \ }

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
let g:netrw_liststyle = 3
