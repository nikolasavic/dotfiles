# About
========

Documentation to set up and configure an Ubuntu droplet on Digital Ocean.

## Outline

  - Installation
  - Configuration
  - Formulas

### Documentation

[install-salt-on-ubuntu](https://www.digitalocean.com/community/tutorials/how-to-install-salt-on-ubuntu-12-04)  
[salt-walkthrough](http://docs.saltstack.com/topics/tutorials/walkthrough.html)  
[salt-formulas](https://www.digitalocean.com/community/tutorials/how-to-create-your-first-salt-formula)  

### Installation

    sudo apt-get install python-software-properties
    sudo add-apt-repository ppa:saltstack/salt
    sudo apt-get update
    sudo apt-get install salt-master
    sudo apt-get install salt-minion

### Configuration

    sudo vim /etc/salt/minion

uncomment and set `master: localhost`  
restart with `sudo service salt-minion restart`  
list all keys with `sudo salt-key -L`  
add your droplet with `sudo salt-key -a Hyperion`

### Formulas
A formula to install vim

    sudo vim /srv/salt/vim.sls
