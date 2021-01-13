echo run helpme for a list of commands
helpme(){
	echo "'register package_name' - to register package"
	echo "'register-g group-name' - to register group"
	echo "'list' - to list registered packages"
	echo "'iso-make' - to build iso"
}
register(){
	rm -rf /var/cache/pacman/pkg/*
	pactree -s -u $1 > /tmp/temporary
	pacman -Sp --noconfirm - < /tmp/temporary > /arch/pkgs/$1
}
register-g(){
	mkdir /arch/pkgs/$1
	rm -rf /var/cache/pacman/pkg/*
	pacman -Sg $1 > /tmp/temporary
	sed -i -e 's/^/register2 /' /tmp/temporary
	bash /tmp/temporary
}
list(){
	ls /arch/pkgs/
}
iso-make(){
	mkdir /usr/share/archiso/configs/releng/airootfs/root/pkg/
	touch /usr/share/archiso/configs/releng/airootfs/root/install.list
	rm -rf /usr/share/archiso/configs/releng/airootfs/root/*
	rm -rf /iso/*
	pkgdown
	cp -r /arch/scripts/* /usr/share/archiso/configs/releng/airootfs/root/
	mkarchiso -v -w /iso -o /out /usr/share/archiso/configs/releng
}

