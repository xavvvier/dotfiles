set nocompatible
syntax enable
filetype off

set t_Co=256
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
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set scrolloff=5
set ignorecase
set nowrap

"NERDTree
"Close NERDTree on open
let g:NERDTreeQuitOnOpen = 1
let NERDTreeIgnore = ['\.beam$']

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
"Plugin 'Shougo/deoplete.nvim'
Plugin 'bling/vim-airline'
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-unimpaired'
Plugin 'Raimondi/delimitMate'
"Ctrlp -> seach files hitting C-p
Plugin 'ctrlpvim/ctrlp.vim'
"git
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive'
"Javascript
"Plugin 'pangloss/vim-javascript'
"Plugin 'jelera/vim-javascript-syntax'
"Omnicompletion with tab
Plugin 'ervandew/supertab'
"Elixir
Plugin 'slashmili/Alchemist.vim'
Plugin 'elixir-lang/vim-elixir'
"Snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
"Window maximize and resize
Plugin 'szw/vim-maximizer' "Maximize window with <leader>m
Plugin 'simeji/winresizer' "Easy window resizing with <C-e> hjkl
"typescript
"follow instructions on vimproc.vim github page
"Plugin 'Shougo/vimproc.vim'
"Plugin 'Quramy/tsuquyomi'
"Plugin 'Quramy/vim-js-pretty-template'
"Plugin 'leafgarland/typescript-vim'
Plugin 'altercation/vim-colors-solarized'
"vim-tmux navigation
Plugin 'christoomey/vim-tmux-navigator'
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
nnoremap <leader>f :NERDTreeFind<CR>
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

inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
"}}}

"Syntastic ------ {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_html_tidy_ignore_errors = [
        \ "<svg> is not recognized!",
        \ "discarding unexpected <svg>",
        \ "discarding unexpected </svg>",
        \]
"let g:syntastic_elixir_checkers = ['elixir']
let g:syntastic_enable_elixir_checker = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"}}}

"Typescript settings {{{
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost l* nested lwindow
autocmd FileType typescript nmap <buffer> <Leader>T : <C-u>echo tsuquyomi#hint()<CR>
autocmd FileType typescript JsPreTmpl html
autocmd FileType typescript syn clear foldBraces
"}}}

" Airline settings {{{
" Font used in terminal is InputMono 12pt Light
" http://input.fontbureau.com/download/
let g:airline#extensions#tabline#enabled =1
let g:airline_powerline_fonts=0
"Show always the status line
set laststatus=2
"Avoid delay when switching from insert mode to normal
set ttimeoutlen=50
"}}}

"Autocmd commands {{{
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.txt set filetype=markdown
autocmd BufRead,BufNewFile *.module set filetype=php
autocmd BufRead,BufNewFile *.install set filetype=php
autocmd BufRead,BufNewFile *.test set filetype=php
autocmd BufRead,BufNewFile *.inc set filetype=php
autocmd BufRead,BufNewFile *.profile set filetype=php
autocmd BufRead,BufNewFile *.view set filetype=php
autocmd BufRead,BufNewFile *.less set filetype=less
autocmd BufRead,BufNewFile *.js set ft=javascript syntax=javascript
autocmd BufRead,BufNewFile *.json set ft=json syntax=javascript
autocmd BufRead,BufNewFile *.ex,*.exs set ft=elixir
autocmd BufRead,BufNewFile *.eex set ft=html.elixir
autocmd BufRead,BufNewFile *.ts set ft=typescript
autocmd FileType elixir :iabbrev po \|>
"Comment and uncomment with gc gC
augroup comments
    autocmd!
    "TODO: add mark to return to the original position
    "TODO: when remove comment, fix indentation
    autocmd FileType vim nnoremap gc ^i"<esc>
    autocmd FileType elixir nnoremap gc ^i#<esc>
    autocmd FileType elixir vnoremap gc :normal! ^i#<cr>
    autocmd FileType vim,elixir nnoremap gC ^x
    autocmd FileType vim,elixir vnoremap gC :normal! ^x<cr>
    autocmd FileType javascript,typescript nnoremap gc ^i//<esc>
    autocmd FileType javascript,typescript vnoremap gc :normal! ^i//<esc>
    autocmd FileType javascript,typescript nnoremap gC ^xx<esc>
    autocmd FileType javascript,typescript vnoremap gC :normal! ^xx<esc>
augroup END
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
    "Fix powerline symbols
    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif
    let g:airline_left_sep = '|'
    let g:airline_left_alt_sep = '|'
    let g:airline_right_sep = '|'
    let g:airline_right_alt_sep = '|'
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''
    set background=dark
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

"To link this file in windows:
"run `mklink /H ".vimrc" "dotfiles/vimrc`
"

set mouse=a
hi VertSplit ctermbg=none  guifg=black guibg=black cterm=NONE gui=NONE
set hlsearch
hi Search ctermbg=gray ctermfg=17

if has('nvim')
    "starts deoplete at startup
    let g:deoplete#enable_at_startup = 1
    "set neovim configuration file in .config/nvim/init.vim
    "set runtimepath^=~/.vim runtimepath+=~/.vim/after
    "let &packpath = &runtimepath
    "source ~/.vimrc
endif
