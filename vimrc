let mapleader = "\<Space>" " Remap leader to ,
set nocompatible
set history=250
set ruler                  " Always show current position
set hidden                 " Hide unsaved buffers

filetype on                " Enable filetype detection
filetype indent on         " Enable filetype-specific indenting
filetype plugin on         " Enable filetype-specific plugins

" Quick save and leave
noremap <Leader>s :update<CR>
noremap <Leader>S :wa<CR>
noremap <Leader>q :q!<CR>
noremap <Leader>Q :qa!<CR>
noremap <Leader>w :wq!<CR>
noremap <Leader>W :wqa!<CR>

" Pathogen
execute pathogen#infect()

" 'scooloose/syntastic'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1

" Respect the .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']

" Display "
"""""""""""
colorscheme solarized
set t_Co=256
let g:solarized_termcolors=16
set background=dark

syntax on        " Syntax highlighting
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

" Ruby
iabbrev ppry require 'pry'; binding.pry
iabbrev rpry logger.info("\n*********\nPRY DEBUG\n*********\n"); require 'pry-remote'; binding.remote_pry

" Show trailing whitespace
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

" This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" Highlight 81st column
highlight ColorColumn ctermbg=red
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

" Quicker Window Movement
""""""""""""
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Plug Ins "
""""""""""""
" NERDTree
" Open nerdtree when vim starts and no files were specified
autocmd vimenter * if !argc() | NERDTree | endif

map <C-n> :NERDTreeToggle<CR>    " Open NerdTree with ctrl+n
map <leader>r :NERDTreeFind<cr>  " Open NerdTree in directory of current file

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

" Tagbar
nnoremap <silent> <Leader>b :TagbarToggle<CR>
