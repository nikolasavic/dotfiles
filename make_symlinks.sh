#!/bin/bash

#   This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
#
#   cd ~/dotfiles
#   chmod +x make_symlinks.sh
#   ./make_symlinks.sh

# Variables
dir=~/dotfiles           # dotfiles directory
olddir=~/dotfiles_old    # old dotfiles backup directory

# list of files/folders to symlink in homedir
files="bashrc bash_profile profile gitignore_global vimrc tmux.conf"

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
echo "Moving any existing dotfiles from ~ to $olddir"
for file in $files; do
    echo 'Moving $file'
    mv ~/.$file ~/dotfiles_old/
    echo "Symlinkling $file"
    ln -s $dir/$file ~/.$file
done
echo '...done'
