# koffe
koffe is a great tool for making intuitive, offline archlinux installers. Since some steps for mastering an arch iso require arch-linux, everything runs inside a container you have to create yourself. Every package installed to the new computer via the installer are from the repo, including base and linux, so no copy-pasting from the iso that could cause issues later.
# Documentation
## Installation
First of all, open a terminal and run this command:
### `curl https://koffe.netlify.app/install-host | sudo bash`
This creates some configs and add some file we will need for the installation.
After the script finishes, from the archlinux website go to a mirror near you and download the .tar.gz bootstrap image and unzip it in `/usr/share/koffe/archbox` so that `/usr/share/koffe/archbox/bin` is a valid folder.
After you're done unziping the image, edit `/usr/share/koffe/archbox/etc/pacman.d/mirrorlist` and uncomment a mirror. Then you should be able to run `koffe-shell` to enter the container, after that run 
### `curl https://koffe.netlify.app/install-box | bash`
and `pacman -Syu` to add the necessary files. After that just exit and re-enter the container and you should be able to use it.
## Usage
After you do `koffe-shell` to enter the container, you can do `help-koffe` to list commands, I'm gonna list the steps of making a basic iso.
### 1.Register the packages (you only have to do this once)
To do that, use the command `register package-name`
#### !!IMPORTANT!! : you need these following packages for even the most basic of installs: base, linux, linux-firmware, libnewt (for the script) and grub, register them before any other packages.
If you package is a group (like gnome, xorg, plasma) do register-g instead of register.
TIP: To make package groups, simply make a folder in /arch/pkgs and move all packages you want to put in said group in that folder, afther that when you select the folder it'll fetch everything in it.
### 2. Make the iso
Run `iso-make`, you will be prompted with a screen where you can choose what packages (from the registered ones) to download for the installation, once again you need the packages listed in step 1 for even the most basic installs, so add them for a healthy install. After you're done choosing the packages and downloading them, choose the "done" option at the very bottom and let the iso generate.
### 3. Collect and use the iso
The iso will be copied from the container to the home folder after you run `exit`, pick it up from there and use it, you can flash it to a usb, burn it to a disk or mount it to a virtual machine.
### 4. Installing
Boot from the iso and run `bash install` in the live env, this should start the installer right away, just follow the steps keeping these steps in mind:
In cfdisk you need at least one partition with the type set as "linux", you can also add one with a "swap" label as long as it is about 1.5 times as big as your ram storage (but this is optional), if you're on uefi create a 500 MB fat32 partition and if you're on mbr/legacy tick the 'bootable' option for the linux partition. Make sure to memorise or write down what partiton (/dev/name) is used for what as you will need to fill that in later.
### 4. Tips for advanced users
You can edit /arch/scripts/ to better suit your installation, koffe.is is what runs in the live env and pi.is is the post-install setup that runs in chroot.
