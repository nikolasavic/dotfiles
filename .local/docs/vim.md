## Vim Setup

### Plugins
#### vim-plug
https://github.com/junegunn/vim-plug
* download and install in `.vim/autoload/`  
  ```
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  ```

#### FZF & FZF.vim
https://github.com/junegunn/fzf.vim
* ```
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  ```
* usage:
  * search files  
    `Files`
  * search lines in loaded buffers  
    `Lines`
  * list all commands, default, assigned and plugin  
    `Commands`

### Misc.
#### Terminal mode
* enter terminal mode  
  `:term`
* enter normal mode from terminal mode  
  `ctrl+w N`
* enter terminal mode from normal terminal mode  
  `i`

_note: to enter vim mode in the alacritty terminal emulater: `ctrl+shift+space`_

reference: https://vimhelp.org/terminal.txt.html

#### Switching tab expansion on and off
* off: `set noet`
* on: `set et`
