# About
========
TODO(Nikola): Finish about section.

## Downloads
   * general  
      * Chrome
      * Firefox
      * Dropbox
   * development  
      * iTerm2
      * HipChat
      * SublimeText
   * utilities  
      * dash
      * sizeup
      * mou
   * misc  
      * inconsolata font

## misc
Disable app nap for finder.

	sudo defaults write com.apple.Finder NSAppSleepDisabled -bool YES

## Shell

### Homebrew

        ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

### Git

        brew update
        brew doctor
        brew install git
        git config --global user.name "Your Full Name"
        git config --global user.email "Your Email Address"
        git config --global credential.helper osxkeychain

### Node

        brew update
        brew doctor
        brew install node
### RBenv
RBenv uses shims in the beginning of $PATH.  To install it:

        brew update
        brew install rbenv ruby-build

Afterwards you'll still need to add `eval "$(rbenv init -)"` to your profile as stated in the caveats. You'll only ever have to do this once.

To list all versions of ruby

        rbenv install -l

Install a Ruby version:

        rbenv install 2.0.0-p247

To see all known versions of ruby as well as the current version

        rbenv versions

**MISC**  
The following command will set directory command line completion to be case insensitive.  
`echo set completion-ignore-case on | sudo tee -a /etc/inputrc`

Install Unix commands

	brew install tree
	brew install ack

## Database
**PostGreSQL**

        brew update
        brew doctor
        brew install postgresql

Add the following aliases to start, stop and check status of your postgres server

		alias pg.start='pg_ctl start -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log'
		alias pg.stop='pg_ctl stop -s -m fast -D /usr/local/var/postgres'
		alias pg.status='pg_ctl status -D /usr/local/var/postgres'

## Editors

### Vim

   * Install `pathogen`
   * Install various packages (nerdTree etc)


### Sublime
**Setting up a command line alias**

   Sublime Text 2 ships with a CLI called subl. This utility is hidden in the following folder *(assuming you installed Sublime in /Applications like normal folk.)*:

        open /Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl  

or if you're using Sublime Text 3  

        open /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl  

We're going to symlink to `/usr/local/bin` which is where most binaries should live

        ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl

You can also add `export EDITOR='sublime -w'` to your ~/.bash_profile to have ST as your default editor (for commenting git commits, using fc etc)

**Installing Pluggins**

To install pluggins from *Package Control*, go to [https://sublime.wbond.net/installation](https://sublime.wbond.net/installation ) and copy the snippet for you editor (ver 2 or 3).  Use **ctrl + `** or **View > Show Console** and paste in the snippet.

**Packages:**

   * [SublimeLinter](http://sublimelinter.readthedocs.org/en/latest/index.html)
   * [SublimeCodeIntel](https://sublime.wbond.net/packages/SublimeCodeIntel)

### RubyMine

Setup a global git ignore file for .idea/

	    cd ~
      touch .gitignore_glocal
Add `.idea/` to *.gitignore_global*

        git config --global core.excludesfile ~/.gitignore_global

Double check your work with `cat ~/.gitconfig`, you should see `excludesfile = /Users/$USER/.gitignore_global`.  If you already have .idea files polluting your repo, you can purge them with `git rm --cached .idea`
