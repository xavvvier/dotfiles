set nocompatible
syntax enable
filetype off

set t_Co=256
set termencoding=utf-8
set relativenumber
set number
"Let me erase with bakcspace at the end of the line
set backspace=indent,eol,start 
"Let me jump between unsaved buffers
set hidden

highlight clear SignColumn
set cursorcolumn
highlight CursorColumn ctermbg=Black
set cursorline
hi CursorLine cterm=NONE ctermbg=black guibg=#101520
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set scrolloff=5
set ignorecase

"NERDTree
"Close NERDTree on open
let g:NERDTreeQuitOnOpen = 1
let NERDTreeIgnore = ['\.beam$']

"User solarized dark
set background=dark

" Omni completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

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

"Plugins {{{
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'bling/vim-airline'
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-sensible'
Plugin 'scrooloose/syntastic'
"Ctrlp -> seach files hitting C-p
Plugin 'ctrlpvim/ctrlp.vim'
"git
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive'
"Javascript
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
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
Plugin 'Shougo/vimproc.vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'Quramy/vim-js-pretty-template'
Plugin 'leafgarland/typescript-vim'
Plugin 'altercation/vim-colors-solarized'
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
nnoremap <leader>d :bn \| bd #<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nmap W $
nmap E $
nmap B ^
"Fast window navigation
nnoremap <C-j> <C-W><C-j>
nnoremap <C-k> <C-W><C-k>
nnoremap <C-l> <C-W><C-l>
nnoremap <C-h> <C-W><C-h>
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
autocmd FileType typescript setl omnifunc=tsuquyomi#complete
autocmd FileType typescript JsPreTmpl html
autocmd FileType typescript syn clear foldBraces
"}}}

" Airline settings {{{
" The font used for powerline fancy symbols is InputMono 11pt
" http://input.fontbureau.com/download/
" For terminal.app use the theme in:
" https://github.com/tomislav/osx-terminal.app-colors-solarized
let g:airline#extensions#tabline#enabled =1
let g:airline_powerline_fonts=1
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
    autocmd FileType vim nnoremap gc ^i"<esc>
    autocmd FileType elixir nnoremap gc ^i#<esc>
    autocmd FileType elixir vnoremap gc :normal ^i#<cr>
    autocmd FileType vim,elixir nnoremap gC ^x
    autocmd FileType vim,elixir vnoremap gC :normal ^x<cr>
augroup END
"}}}

"Windows settings {{{
colorscheme solarized
if has('gui_running') && has('win32')
    set guifont=Source_Code_Pro_Light:h12:cANSI:qDRAFT
    "remove gui toolbars and menus
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    "Fix powerline symbols
    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''
    set background=dark
endif
"}}}

" Vimscript file settings ------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim set foldmethod=marker
augroup END
" }}}

"To link this file in windows:
"run `mklink /H ".vimrc" "dotfiles/vimrc`
"

