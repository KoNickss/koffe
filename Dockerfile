FROM archlinux
RUN install -d /usr/bin/
RUN install -d /usr/share/koffe
RUN install -d /finalimage
COPY koffe /usr/bin/koffe
COPY pi.is /usr/share/koffe/pi.is
COPY install /usr/share/koffe/install
RUN chmod +x /usr/bin/koffe
RUN pacman -Suy --noconfirm
RUN pacman -S sudo base archiso pacman-contrib libnewt wget git --noconfirm
ENTRYPOINT ["/usr/bin/koffe"]
