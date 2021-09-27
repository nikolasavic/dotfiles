# Arch Install

## Overview
This is a guide to install Arch linux using systemd-boot and systemd-networkd for a wired ethernet connection.

## Minimum Install

### Partition and Format Disk
1. list partitions  
   `lsblk`

1. use gdisk to write to the  GPT (GUID partition table)  
   `gdisk /dev/nvme0n1`

1. create filesystems on the partitions:

    * make efi partition  
      `mkfs.vfat /dev/nvme0n1p1`

    * make swap partition  
      `swapon /dev/nvme0n1p2`

    * make linux system partition with labels  
      `mkfs.ext4 /dev/nvme0n1p3 -L arch`

1. mount partitions

    * mount where distro will be installed  
      `mount /dev/nvme0n1p3 /mnt`

    * create boot and home directories  
      `mkdir /mnt/boot`

    * mount boot directory  
      `mount /dev/nvme0n1p1 /mnt/boot`

### Install Distribution
install linux and essential packages  
`pacstrap /mnt base linux linux-firmware amd-ucode vim`

### Generate Filesystem Table
generate a fstab file, use `-U` for UUID or `-L` for labels  
`genfstab -U /mnt >> /mnt/etc/fstab`

### Chroot
change root to new system  
`arch-chroot /mnt`

### Time Zone
1. set the time zone  
   `ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime`

1. sync system time  
   `timedatectl set-ntp true`  
   `timedatectl status`

1. generate `/etc/adjtime`  
   `hwclock --systohc`

### Localization
1. edit `/etc/locale.gen` and uncomment `en_US.UTF-8 UTF-8`, then generate locales  
   `locale-gen`

1. create locale.conf and add  
   `LANG=en_US.UTF-8`

### Network Configuration
1. list all network interfaces  
   `ip address`  
   `ip link`

1. list all network devices on system  
   `networkctl list`

1. start and enable the network service  
   `systemctl start systemd-networkd.service`  
   `systemctl enable systemd-networkd.service`

1. start and enable the network name resolution service  
   `systemctl start systemd-resolved.service`  
   `systemctl enable systemd-resolved.service`

### Root and User
1. change root password  
   `passwd`

1. add user  
   `useradd -m nikola`  
   `passwd nikola`

1. add user to wheel  
   `usermod -aG wheel`

1. allow wheel group members sudo access, edit and uncomment the following line in `/etc/sudoers`  
   `%wheel      ALL=(ALL) ALL`

1. give full root priveleges  
   `echo "nikola ALL=(ALL) ALL >> etc/sudoers.d/nikola"`

### Systemd-boot
1. install systemd-boot  
   `bootctl install`

1. edit loader config in `/boot/loader/loader.conf`

1. create entries in `/boot/loader/entries/`, the resume UUID is for hibernation support and references the swap partition
   ```
   title    Arch
   linux    /vmlinuz-linux
   initrd   /amd-ucode.img
   initrd   /initramfs-linux.img
   options  root="LABEL=arch" rw resume=UUID=xxxxxxxx-xxxx-xxxx-xxxxxxxxxxxx
   ```

_note: when referring to your partition, there is a difference between UUID assigned by your filesystem and partition UUID_
* `ls -al /dev/disk/by-uuid`
* `ls -al /dev/disk/by-partuuid`

### Reboot
1. exit chroot  
   `exit`

1. unmount all  
   `umount -R /mnt`

1. reboot  
   `sudo reboot`

## Post-Install Customization

### Install base packages
* `efibootmgr`
* `base-devel`
* `git`
* `linux-headers`
* `nvidia`, `nvidia-utils` & `nvidia-settings`
* `pacman-contrib`
* `alacritty`
* `xorg` & `xorg-xinit`
* `xmonad`, `xmonad-contrib`
* `xmobar`
* `picom`
* `nitrogen`
* `dmenu`
* `lsd`
* `tree`
* `htop`
* `neofetch`
* `firefox`

### Shared partition _(Optional)_
to mount a shared data partition for use on multiple distros

1. edit `/etc/fstab`  
   `UUID=<shared parition uuid> /mnt/shared ext4 defaults 0 0`

1. change permissions of the mount point `/mnt/shared`  
   `cd /mnt`  
   `sudo chown nikola shared/`  
   `sudo chgrp nikola shared/`  
   `sudo chmod 751 shared/`

### Multi-Boot Linux _(Optional)_
1. mount `ESP` to `/mnt/efi`
1. create an installs directory for each distro
   ```
   /mnt/efi
   --------
   ├── EFI
   │   ├── Boot
   │   │   └── BOOTX64.EFI
   │   └── systemd
   │       └── systemd-bootx64.efi
   ├── installs
   │   ├── Arch
   │   │   ├── initramfs-linux-fallback.img
   │   │   ├── initramfs-linux.img
   │   │   ├── amd-ucode.img
   │   │   └── vmlinuz-linux
   │   └── Debian
   │       ├── initramfs-linux.img
   │       └── vmlinuz-linux
   └── loader
       ├── entries
       │   ├── Arch.conf
       │   ├── Debian.conf
       └── loader.conf
   ```
1. bind mount each distro directory to the `/boot` directory of the installation  
   `/mnt/efi/installs/Arch /boot none defaults,bind 0 0`

reference:

* https://wiki.archlinux.org/title/EFI_system_partition
* https://ramsdenj.com/2016/04/15/multi-boot-linux-with-one-boot-partition.html

### Keyboard modifiers
to avoid losing keyboard layout and mappings when switching keyboard with usb  
```
localectl --no-convert set-x11-keymap us "" "" terminate:ctrl_alt_bksp,caps:ctrl_modifier,altwin:swap_alt_win
```

you can verify the results in this file

```
/etc/X11/xorg.conf.d/00-keyboard.conf
-------------------------------------
# Written by systemd-localed(8), read by systemd-localed and Xorg. It's
# probably wise not to edit this file manually. Use localectl(1) to
# instruct systemd-localed to update it.
Section "InputClass"
        Identifier "system-keyboard"
        MatchIsKeyboard "on"
        Option "XkbLayout" "us"
        Option "XkbOptions" "terminate:ctrl_alt_bksp,caps:ctrl_modifier,altwin:swap_alt_win"
EndSection
```

### TRIM
TRIM optimizes performance and ensures the longevity of your SSD drive by minimizing write amplification.

* `sudo systemctl status fstrim.timer`
* `sudo systemctl enable fstrim.timer`
* `sudo systemctl start fstrim.timer`

### Install `yay`
1. `cd /opt`
1. `sudo git clone https://aur.archlinux.org/yay.git`
1. change file permissions from root to sudo user  
   `sudo chown -R nikola:nikola ./yay`
1. `cd yay`
1. `makepkg -si`

### Install yay Packages
1. Install `yadm`

   1. `yay -Syu yadm-git`
   1. `yadm clone https://github.com/nikolasavic/dotfiles.git`
   1. `yadm status`

1. Nerd Fonts

   1. `yay -Syu nerd-fonts-complete`

### Initramfs Hooks and Modules
edit `vim /etc/mkinitcpio.conf`

1. early loading of nvidia module  
   `MODULES=(nvidia)`

1. hibernation support, add `resume`  
   `HOOKS=(base udev autodetect modconf block filesystems keyboard fsck resume)`

1. `mkinitcpio -p linux`

note: don't forget to run `mkinitcpio` every time there is a driver update or automate with pacman hook:  

```
/etc/pacman.d/hooks/nvidia.hook
-------------------------------
[Trigger]
Operation=Install
Operation=Upgrade
Operation=Remove
Type=Package
Target=nvidia
Target=linux
# Change the linux part above and in the Exec line if a different kernel is used

[Action]
Description=Update Nvidia module in initcpio
Depends=mkinitcpio
When=PostTransaction
NeedsTargets
Exec=/bin/sh -c 'while read -r trg; do case $trg in linux) exit 0; esac; done; /usr/bin/mkinitcpio -P'
```

reference:

* https://wiki.archlinux.org/title/NVIDIA
* https://wiki.archlinux.org/title/Mkinitcpio#Configuration

### Reflector Config
* install reflector  
  `sudo pacman -Sy reflector`
* enable reflector timer  
  `systemctl enable reflector.timer`

### Starship Prompt
install with  
`sh -c "$(curl -fsSL https://starship.rs/install.sh)"`

note:

* requires nerd fonts
* re-run to update

### Update markdown mime type to text
to view markdown files as text in browser
```
.local/share/mime/packages/text-markdown.xml
--------------------------------------------
<?xml version="1.0"?>
<mime-info xmlns='http://www.freedesktop.org/standards/shared-mime-info'>
  <mime-type type="text/plain">
    <glob pattern="*.md"/>
    <glob pattern="*.mkd"/>
    <glob pattern="*.markdown"/>
  </mime-type>
</mime-info>
```
then run `update-mime-database ~/.local/share/mine`

reference: https://superuser.com/questions/696361/how-to-get-the-markdown-viewer-addon-of-firefox-to-work-on-linux

### Setup Mullvad VPN (wireguard) WIP
setup Mullvad VPN directly with wireguard configuration

* ensure you have `wireguard-tools` & `systemd-resolvconf` installed
* Use https://mullvad.net/en/account/#/wireguard-config/ to create and downlaod a wireguard conf file
* move mullvad config to `/etc/wireguard`
* set up VPN connection  
  `wg-quick up mkvd-usxxx`

reference:
* https://wiki.archlinux.org/title/Mullvad
* https://wiki.archlinux.org/title/WireGuard
* https://bbs.archlinux.org/viewtopic.php?id=265255

