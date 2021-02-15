# koffe
# This repo has been moved to https://aur.archlinux.org/koffe after it's release on the aur, clone that if you want to review the package.
# If you're using another distrbution/MacOS create a chroot system (using the bootstrap image on the arch page), configure the repos, then simply install koffe from the aur either manually or with an aur helper. If you're on windows see if you can find arch in WSL or switch to a better OS.
# Converting a standard Arch USB to koffe without any other OS (internet required):
In the grub boot menu, press tab on the menu entry you want to boot and add `copytoram` at the end of the kernel parameters, boot from that.
Next, clone the koffe repo from the aur and install it (`git clone https://aur.archlinux.org/koffe ; chown -hR nobody koffe ; cd koffe ; sudo -u nobody makepkg -si`). Generate your iso using koffe (documentation @ koffe --help), then lsblk and identify your arch USB, wipe the file system `wipefs --all /dev/sdX` (make sure you're wiping the entire drive, not just a partition) then burn the koffe iso (`cat /root/*.iso > /dev/sdX`) once again, make sure you're doing it to the whole drive, not just a partition.
# Introduction
koffe is a great tool for making intuitive, offline archlinux installers. Since some steps for mastering an arch iso require arch-linux, everything runs inside a container you have to create yourself. Every package installed to the new computer via the installer are from the repo, including base and linux, so no copy-pasting from the iso that could cause issues later.
#Documentation
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

The output iso will most likely be in /root/ and will require root permission to extract, this is to prevent non-admins making isos willy nilly and potentially ruining a system.

# Installation
Installation is pretty easy, just boot from the iso and type `bash install`, the installer will do everything for you.

# Who is this meant for?
For anyone in need of offline installers, may be people with wifi driver problems, sys admins with poor internet connections needing to install arch on many systems, etc. The interchangeable scripts and easy to edit nature of koffe make it very easy to turn into a specialized tool that can install arch without any user intervention. In general, it's for the people, use and publish it as you like as long as you respect the license
