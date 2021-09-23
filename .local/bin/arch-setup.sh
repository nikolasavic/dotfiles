echo "*\$* Starting Arch Setup"

echo "*\$* Refreshing package database"
sudo pacman -Syy

echo "*\$* Installing packages"
sudo pacman -Sy --noconfirm - < arch-pkglist.txt

echo "*\$* Installing prompt"
# Starship Promt
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

echo "*\$* Arch Setup complete!"
