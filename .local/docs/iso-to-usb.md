## Copying ISO file to USB drive

### Mac

1. list all drives  
   `diskutil list`
1. unmount usb  
   `diskutil unmountDisk /dev/diskN`
1. write to usb  
   `sudo dd if=/path-to.iso of=/dev/rdiskN bs=1m`
1. eject usb drive  
   `diskutil eject /dev/diskN`

notes:

* use full paths to iso
* press `ctrl+t` while dd is running to see progress

reference:  
https://apple.stackexchange.com/questions/73183/copying-iso-file-to-usb-drive-in-os-x

