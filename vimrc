" General "
"""""""""""
" We're running Vim, not Vi!
set nocompatible

set history=250

" Remap leader to ,
let mapleader = "\<Space>"

" Enable filetype detection
filetype on

" Enable filetype-specific indenting
filetype indent on

" Enable filetype-specific plugins
filetype plugin on

" Always show current position
set ruler

" Hide unsaved buffers
set hidden

" Quick save and leave
noremap <Leader>s :update<CR>
noremap <Leader>S :wa<CR>
noremap <Leader>q :q!<CR>
noremap <Leader>Q :qa!<CR>
noremap <Leader>W :wqa!<CR>

" Display "
"""""""""""
" Show line numbering and color white
set number

" Auto indent
set ai

" Always use spaces instead of tabs
set expandtab

" Display incomplete commands
set showcmd

" size of a hard tabstop
set tabstop=2

" size of an "indent"
set shiftwidth=2

" Syntax highlighting
syntax on

" Highlight currentline
set cursorline

" Scroll off
set scrolloff=3

" Highlight search
set hlsearch
:highlight Search ctermbg=Green ctermfg=Black

" This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" Incremental search
set incsearch

" Show trailing whitespace
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

" Highlight 81st column
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)


" Toggle between relative and absolute numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

map <C-g> :call NumberToggle()<cr>

" Movement "
""""""""""""
" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Plug Ins "
""""""""""""
" Pathogen
execute pathogen#infect()

" NERDTree
" Open nerdtree when vim starts and no files were specified
autocmd vimenter * if !argc() | NERDTree | endif

" Open nerdtree with ctrl+n
map <C-n> :NERDTreeToggle<CR>

" Close nerdtree if the only window left open is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Fugitive
" Open git blame split  with ctrl+b
map <C-b> :Gblame<CR>

" Rainbow Parenthesis always on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Tslime
let g:tslime_ensure_trailing_newlines = 1
let g:tslime_normal_mapping = '<localleader>t'
let g:tslime_visual_mapping = '<localleader>t'
let g:tslime_vars_mapping = '<localleader>T'
