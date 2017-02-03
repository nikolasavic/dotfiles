# Dotfiles
===========

### About
This is a collection of dotfiles that I use to regulate my environment.

### Installation

   * `git clone https://github.com/nikolasavic/Dotfiles.git`
   * `cd dotfiles`
   * `chmod +x make_symlinks.sh`
   * `./make_symlinks.sh`
   * `cd`
   * `source .bashrc`

**Notes**   
Running the script will move any existing versions of the dotfiles into `~/dotfiles_old`
and then add symlinks to the files in `~/dotfiles`.  To undo changes, delete `~/dotfiles`
and move all the files in `~/dotfiles_old` to `~/`.
