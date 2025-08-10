FROM debian:trixie

RUN apt update && \
    apt install -y wget

RUN echo "Types: deb\nURIs: http://download.proxmox.com/debian/pve\nSuites: trixie\nComponents: pve-no-subscription\nSigned-By: /usr/share/keyrings/proxmox-archive-keyring.gpg" > /etc/apt/sources.list.d/proxmox.sources
RUN echo "Types: deb\nTypes: deb\nURIs: http://download.proxmox.com/debian/ceph-squid\nSuites: trixie\nComponents: no-subscription\nSigned-By: /usr/share/keyrings/proxmox-archive-keyring.gpg" > /etc/apt/sources.list.d/ceph.sources
RUN wget -O /usr/share/keyrings/proxmox-archive-keyring.gpg "https://enterprise.proxmox.com/debian/proxmox-archive-keyring-trixie.gpg"

RUN apt update && apt dist-upgrade -y
RUN apt install -y devscripts autotools-dev autogen dh-autoreconf dkms doxygen check pkg-config \
            groff quilt automake autoconf libtool lintian libdevel-cycle-perl \
            libjson-perl libcommon-sense-perl liblinux-inotify2-perl libio-stringy-perl \
            libstring-shellquote-perl rpm2cpio libsqlite3-dev sqlite3 \
            libglib2.0-dev librrd-dev librrds-perl rrdcached libdigest-hmac-perl \
            libxml-parser-perl gdb libcrypt-openssl-random-perl \
            libcrypt-openssl-rsa-perl libnet-ldap-perl libauthen-pam-perl \
            libjson-xs-perl libterm-readline-gnu-perl oathtool libmime-base32-perl \
            liboath0 libpci-dev texi2html libsdl1.2-dev libgnutls28-dev \
            libspice-protocol-dev xfslibs-dev libnuma-dev libaio-dev \
            libusbredirparser-dev glusterfs-common \
            libusb-1.0-0-dev librbd-dev libpopt-dev bridge-utils numactl \
            glusterfs-common ceph-common libgoogle-perftools4 \
            libfile-chdir-perl lvm2 glusterfs-client liblockfile-simple-perl \
            libsystemd-dev libio-multiplex-perl \
            libnetfilter-log-dev ipset socat libsasl2-dev libogg-dev \
            libfilesys-df-perl libcrypt-ssleay-perl \
            libfile-readbackwards-perl libanyevent-perl libanyevent-http-perl \
            unzip liblocale-po-perl libfile-sync-perl cstream \
            lzop dtach hdparm gdisk parted \
            liblzma-dev dosfstools mtools libxen-dev libfuse-dev libcpg-dev libquorum-dev \
            libcmap-dev libuuid-perl libqb-dev libapparmor-dev docbook2x libcap-dev \
            dh-apparmor graphviz libseccomp-dev libglib-perl libgtk3-perl libnss3-dev \
            libdlm-dev libudev-dev asciidoc-dblatex source-highlight libiscsi-dev \
            libiscsi7 librsvg2-bin libarchive-dev libgpgme-dev libcurl4-gnutls-dev \
            libtest-mockmodule-perl libjemalloc-dev libjpeg-dev
RUN apt install -y proxmox-default-kernel
RUN apt remove -y linux-image-amd64 'linux-image-6.12*'
RUN apt install -y debhelper-compat python3 python3-venv meson ninja-build flex bison python3-sphinx python3-sphinx-rtd-theme
RUN git config --global url."https://github.com/tianocore/edk2-subhook.git".insteadOf https://github.com/Zeex/subhook.git