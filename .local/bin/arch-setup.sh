echo "*\$* Starting Arch Setup"

echo "*\$* Refreshing package database"
sudo pacman -Syy

echo "*\$* Installing packages"
sudo pacman -S --needed - < ~/.local/bin/arch-pkglist.txt

# Starship Promt
echo "*\$* Installing prompt"
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

# vim-plug
echo "*\$* Installing vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "*\$* Arch Setup complete!"

# Rebuild arch-pkglist.txt
#   `pacman -Qqe > pkglist.txt`
#
# note: AUR packages will need to be removed from this list manually
# Reference:
#   https://wiki.archlinux.org/title/Pacman/Tips_and_tricks#List_of_installed_packages
#   https://ostechnix.com/create-list-installed-packages-install-later-list-arch-linux/
