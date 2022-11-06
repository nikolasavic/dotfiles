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
https://github.com/junegunn/fzf/wiki  
* ```
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  ```
* vim usage:
  * search files  
    `Files`
  * search lines in loaded buffers  
    `Lines`
  * list all commands, default, assigned and plugin  
    `Commands`
* terminal usage:
  * fuzzy completion:  
    `some-cmd <ctrl-t>`  
    `some-cmd **<TAB>`
  * history search  
    `<ctrl-r>`

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

#### Ctags
* go to source  
  `ctrl+]`  

* search
  `:tag <searchTag>`  
  `:tag A<tab>` autocompletes all tags starting with a
* tag stack
  * see last 20 tags used  
    `:tags`
  * pop from tag stack  
   `ctrl+T` or `:pop`

#### Switching tab expansion on and off
* off: `set noet`
* on: `set et`
