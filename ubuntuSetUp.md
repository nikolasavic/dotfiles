 # About
=========

Documentation to set up a new Ubuntu droplet on Digital Ocean.

## Outline
 - Setup
   * Adding users & passwords
   * visudo
   * permissions
   * ssh

 - Installation
   * git
   * vim
   * tmux

## Docs
[unix-create-user-account](http://www.cyberciti.biz/faq/unix-create-user-account/)
[initial-server-setup](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-12-04)
[edit-sudoers-file](https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file-on-ubuntu-and-centos)
[git-installation](https://www.digitalocean.com/community/tutorials/how-to-install-git-on-ubuntu-12-04)

### Adding users & passwords

    $ useradd -m tom
    $ passwd tom

### visudo
Change default `visudo` editor with:

    sudo update-alternatives --config editor

### permissions
Add username below root and give permissions:

    root        ALL=(ALL:ALL) ALL
    demo        ALL=(ALL:ALL) ALL

### ssh
Edit ssh configuration:

    nano /etc/ssh/sshd_config

Find and edit:

    port 2501
    Protocol 2
    PermitRootLogin no

Add these to the bottom of you file:

    UseDNS no
    AllowUsers Nikola

This will change port login to 2501, not allow root login and only allow `Nikola` to ssh.
Reload with:

    reload ssh

## Installation
### git
*Install*

    sudo apt-get install git-core

*Configure*

    sudo vim ~/.gitconfig

or with individual commands

    git config --global user.name "Nikola-"
    git config --global user.email nikolasavic@gmail.com

### vim
*Install*

    sudo apt-get install vim

Add vim pluggins in ~/.vim/bundle/
     git clone https://github.com/scrooloose/nerdtree.git
     git clone https://github.com/vim-scripts/paredit.vim.git
     git clone https://github.com/tomtom/tlib_vim.git
     git clone https://github.com/vim-scripts/tslime.vim.git
     git clone https://github.com/kien/rainbow_parentheses.vi
     git clone https://github.com/kien/rainbow_parentheses.vid
     git clone https://github.com/tpope/vim-pathogen.git
     git clone https://github.com/tpope/vim-rails.git
     git clone https://github.com/tpope/vim-fugitive.git
     git clone https://github.com/tpope/vim-endwise.git
     git clone https://github.com/tpope/vim-surround.git
     git clone https://github.com/tpope/vim-fireplace.git
     git clone https://github.com/tpope/vim-dispatch.git
     git clone https://github.com/tpope/vim-projectionist.git
     git clone https://github.com/tpope/vim-bundler.git
     git clone https://github.com/tpope/vim-heroku.git
     git clone https://github.com/tpope/vim-commentary.git

If vim-pathogen isnt infecting properly:

    cd ~/.vim
    mkdir autoload
    cp pathogen.vim ~/.vim/autoload

### tmux
*Install*

    sudo apt-get install tmux
