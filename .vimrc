" Reload vimrc with `:so $MYVIMRC`

" Defaults
set nocompatible                      " Keeps you safe from unexpected things your distro might have made and to safely re-source .vimrc
set hidden                            " Allows you to re-use the same window and switch from an unsaved buffer without saving first.
set noswapfile                        " More annoying than mosquitos
set history=512                       " 2 ** 9
set encoding=utf-8
scriptencoding utf-8

" Appearance
syntax on                             " Syntax highlighting
set ruler                             " Always show current position
set number                            " Line numbering
set cursorline                        " Highlight current line
set scrolloff=3                       " Scroll off

" Control
let mapleader = "\<Space>"            " Remap leader

" Display
set showcmd                           " Show partial commands

" Filetype Behavior
filetype on                           " Enable filetype detection
filetype indent on                    " Enable filetype specific indentation
filetype plugin on                    " Enable filetype specific plugins

" Quicker Window Movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Search
set ignorecase                        " Case insensitive search,
set smartcase                         " except when using capitals
set hlsearch                          " Highlight search results after <ENTER>
set incsearch                         " Highlight all pattern matches while typing
nnoremap <CR> :noh<CR><CR>            " Unsets last search pattern with <ENTER>

" Spacing
set shiftwidth=2                      " Size of indent
set tabstop=2                         " Size of tab
set expandtab                         " Use spaces instead of tabs
set autoindent                        " Auto indent

" Trailing whitespace
set listchars=trail:·,tab:-,nbsp:␣
set list

" Nerdtree
nnoremap <C-n> :NERDTree<CR>

" vim plug
call plug#begin()

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Nerd Tree
Plug 'preservim/nerdtree'

call plug#end()
