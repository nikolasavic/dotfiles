" Reload vimrc with `:so $MYVIMRC`

let mapleader = "\<Space>" " Remap leader to ,
set nocompatible
set history=250
set ruler                  " Always show current position
set hidden                 " Hide unsaved buffers
set noswapfile             " No swap files

syntax on                  " Syntax highlighting
filetype on                " Enable filetype detection
filetype indent on         " Enable filetype-specific indenting
filetype plugin on         " Enable filetype-specific plugins

" Quick save and leave
""""""""""""""""""""""
noremap <Leader>s :update<CR>
noremap <Leader>S :wa<CR>
noremap <Leader>q :q!<CR>
noremap <Leader>Q :qa!<CR>
noremap <Leader>w :wq!<CR>
noremap <Leader>W :wqa!<CR>

" Quicker Window Movement
"""""""""""""""""""""""""
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Display
"""""""""
set t_Co=256
set background=light

set number       " Show line numbering and color white
set ai           " Auto indent
set expandtab    " Always use spaces instead of tabs
set showcmd      " Display incomplete commands
set tabstop=2    " size of a hard tabstop
set shiftwidth=2 " size of an "indent"
set cursorline   " Highlight currentline
set scrolloff=3  " Scroll off
set hlsearch     " Highlight search
set incsearch    " Incremental search
set mouse=a      " >< mouse!

" Show trailing whitespace
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

" This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" Highlight 81st column
highlight ColorColumn ctermbg=red
call matchadd('ColorColumn', '\%81v', 100)

" Plug Ins
""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" <3 tpope
" vim-fugitive
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" vim-gitgutter
Plug 'airblade/vim-gitgutter'

" vim-syntastic/syntastic
Plug 'vim-syntastic/syntastic'

" vim-autoformat
Plug 'Chiel92/vim-autoformat'

" nerdtree
Plug 'scrooloose/nerdtree'

" ag.vim
Plug 'rking/ag.vim'

Plug 'ctrlpvim/ctrlp.vim'

" fzf
Plug '/usr/local/opt/fzf'
call plug#end()

" vim-autoformat
noremap <leader>f :Autoformat<CR>

"let g:formatterpath = ['~/.gem/ruby/2.3.1/gems/rubocop-0.47.1/bin/',
"                     \ '/usr/local/opt/llvm/bin']

" 'scooloose/syntastic'
let g:syntastic_always_populate_loc_list = 1

" Respect the .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']

" NERDTree
map <C-n> :NERDTreeToggle<CR>    " Open NerdTree with ctrl+n
map <leader>r :NERDTreeFind<cr>  " Open NerdTree in directory of current file

" Fugitive
map <C-b> :Gblame<CR>
