FROM archlinux
RUN install -d /usr/bin/
RUN install -d /usr/share/koffe
COPY koffe /usr/bin/koffe
COPY pi.is /usr/share/koffe/pi.is
COPY install /usr/share/koffe/install
RUN chmod +x /usr/bin/koffe
RUN pacman -Sy base archiso pacman-contrib libnewt wget git --noconfirm
RUN install -d /finalimage
ENTRYPOINT ["/usr/bin/koffe"]
