set nocompatible
syntax enable
filetype off
let mapleader = ','

set t_Co=256
set termencoding=utf-8
set relativenumber
set number
"Let me erase with bakcspace at the end of the line
set backspace=indent,eol,start 
"Let me jump betweent unsaved buffers
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

" Put yanks in the so's clipboard
set clipboard=unnamed
    
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-markdown'
Plugin 'vim-ruby/vim-ruby'
Plugin 'elixir-lang/vim-elixir'
Plugin 'scrooloose/syntastic'
"Snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
nnoremap <leader><leader> <C-^>
nnoremap <space> :
"map space space to save file
nnoremap <space><space> :w<CR>
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>
nnoremap <leader>d :bd<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
"" Abbreviations
iabbrev adn and
iabbrev waht what
nnoremap H 00
nnoremap L $

" Arrow keys
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>

inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['jshint']
"let g:syntastic_elixir_checkers = ['elixir']
"let g:syntastic_enable_elixir_checker = 1

" Airline settings
" The font used for powerline fancy symbols is InputMono 11pt
" http://input.fontbureau.com/download/
" For terminal.app use the theme in:
" https://github.com/tomislav/osx-terminal.app-colors-solarized
let g:airline#extensions#tabline#enabled =1
let g:airline_powerline_fonts=1
"Show always te status line
set laststatus=2
"Avoid delay when switching from insert mode to normal
set ttimeoutlen=50

autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.txt set filetype=markdown
autocmd BufRead,BufNewFile *.module set filetype=php
autocmd BufRead,BufNewFile *.install set filetype=php
autocmd BufRead,BufNewFile *.test set filetype=php
autocmd BufRead,BufNewFile *.inc set filetype=php
autocmd BufRead,BufNewFile *.profile set filetype=php
autocmd BufRead,BufNewFile *.view set filetype=php
autocmd BufNewFile,BufRead *.less set filetype=less
autocmd BufRead,BufNewFile *.js set ft=javascript syntax=javascript
autocmd BufRead,BufNewFile *.json set ft=json syntax=javascript
autocmd BufRead,BufNewFile *.eex set ft=html.eelixir


