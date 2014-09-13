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
