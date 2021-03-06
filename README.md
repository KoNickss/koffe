# koffe

# Introduction
koffe is a great tool for making intuitive, offline archlinux installers. Since some steps for mastering an arch iso require arch-linux, everything runs inside a container you have to create yourself. Every package installed to the new computer via the installer are from the repo, including base and linux, so no copy-pasting from the iso that could cause issues later.
# Documentation
Flags:
koffe --pacs=Prog1,Prog2 -----> starts koffe and creates
                                an iso with the programs Prog1 and Prog2
                                IMPORTANT: Separate the progs with commas
                                and do not use spaces

koffe --clean ----------------> cleans building dirs after unexpected
                                exit or unsuccesful iso generation. Will
                                nullify any other args parsed with it and will
                                not create an iso

koffe --scripts=/path/path/ --> copies the scripts in the specified path
                                and uses them instead of the default koffe
                                scripts in /usr/share/koffe/. Avoid paths with spaces


# Installation
Installation is pretty easy, just boot from the iso and type `bash install`, the installer will do everything for you.

# Who is this meant for?
For anyone in need of offline installers, may be people with wifi driver problems, sys admins with poor internet connections needing to install arch on many systems, etc. The interchangeable scripts and easy to edit nature of koffe make it very easy to turn into a specialized tool that can install arch without any user intervention. In general, it's for the people, use and publish it as you like as long as you respect the license


# Making a koffe disk
If you're using another distrbution create a chroot system (using the bootstrap image on the arch page), configure the repos, then simply install koffe from the aur either manually or with an aur helper. If you're on windows see if you can find arch in WSL or switch to a better OS.
## New: you can now also use koffe through docker for easy peasy use on Windows and macOS, just run the following Commands:
`git clone https://github.com/konickss/koffe`

`cd koffe`

`sudo docker build -t koffe .`

`sudo docker run --workdir /finalimage -v ADRESS_ON_HOST:/finalimage --privileged --rm koffe /usr/bin/koffe --pacs=base,linux`

Note: replace ADRESS_ON_HOST with a absolute path on your host, something like `c:\\Foo\\bar\\` on windows or `/foo/bar` on lnx/macOS/bsd
## Converting a standard Arch USB to koffe without any other OS (internet required):
In the grub boot menu, press tab on the menu entry you want to boot and add `copytoram` at the end of the kernel parameters, boot from that.
Next, clone the koffe repo from the aur and install it (`git clone https://aur.archlinux.org/koffe ; chown -hR nobody koffe ; cd koffe ; sudo -u nobody makepkg -si`). Generate your iso using koffe (documentation @ koffe --help), then lsblk and identify your arch USB, wipe the file system `wipefs --all /dev/sdX` (make sure you're wiping the entire drive, not just a partition) then burn the koffe iso (`cat /root/*.iso > /dev/sdX`) once again, make sure you're doing it to the whole drive, not just a partition.

# A bit about the source code
Basically koffe is the actual program, install is the live env installation script (includes package installation and partitioning) while pi.is is copied and ran in chroot and handles stuff like timezones and user acounts, you can replace the two installation scripts with any of your choice using the `--scripts` flag

# Making 'ready to go' installers with your exact configurations
Koffe is not really made for installing vanilla arch quickly as much as it is for installing the EXACT arch you want in minutes, with basic shell scripting skills you can do this yourself, make some custom scripts, include your dotfiles and configurations in the iso (put them in /usr/share/archiso/configs/releng/airootfs/root for easy acces), clone some gits, move some files and have the installation scripts handle compilation and installation, the goal is that when you reboot you will have your workflow there, waiting for you, arch as you picture it
