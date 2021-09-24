echo "*\$* Starting Arch Setup"

echo "*\$* Refreshing package database"
sudo pacman -Syy

echo "*\$* Installing packages"
sudo pacman -S - < arch-pkglist.txt

echo "*\$* Installing prompt"
# Starship Promt
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

echo "*\$* Arch Setup complete!"

# Rebuild arch-pkglist.txt
#   `pacman -Qqe > pkglist.txt`
#
# note: AUR packages will need to be removed from this list manually
# Reference:
#   https://wiki.archlinux.org/title/Pacman/Tips_and_tricks#List_of_installed_packages
#   https://ostechnix.com/create-list-installed-packages-install-later-list-arch-linux/
