FROM debian:trixie

RUN apt-get update && \
    apt-get install -y wget

RUN echo "Types: deb\nURIs: http://download.proxmox.com/debian/pve\nSuites: trixie\nComponents: pve-no-subscription\nSigned-By: /usr/share/keyrings/proxmox-archive-keyring.gpg" > /etc/apt/sources.list.d/proxmox.sources
RUN echo "Types: deb\nTypes: deb\nURIs: http://download.proxmox.com/debian/ceph-squid\nSuites: trixie\nComponents: no-subscription\nSigned-By: /usr/share/keyrings/proxmox-archive-keyring.gpg" > /etc/apt/sources.list.d/ceph.sources
RUN wget -O /usr/share/keyrings/proxmox-archive-keyring.gpg "https://enterprise.proxmox.com/debian/proxmox-archive-keyring-trixie.gpg"

RUN apt-get update && apt-get dist-upgrade -y
RUN apt-get install -y devscripts autotools-dev autogen dh-autoreconf dkms doxygen check pkg-config \
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
RUN apt-get install -y docutils-common fonts-font-awesome libacl1-dev libattr1-dev libcap-ng-dev \
            libcap2-bin libegl-dev libepoxy-dev libfdt-dev libfdt1 libgbm-dev \
            libglusterfs-dev libgstreamer-plugins-base1.0-0 libgstreamer1.0-0 \
            libjs-sphinxdoc libjs-underscore liborc-0.4-0 libpixman-1-dev \
            libproxmox-backup-qemu0 libproxmox-backup-qemu0-dev libslirp-dev libslirp0 \
            libspice-server-dev libspice-server1 liburing-dev liburing2 libva-drm2 \
            libva2 libvirglrenderer-dev libvirglrenderer1 libvulkan1 libzstd-dev meson \
            ninja-build python-babel-localedata python3-alabaster python3-babel \
            python3-docutils python3-imagesize python3-jinja2 python3-markupsafe \
            python3-packaging python3-pip-whl python3-pygments python3-roman \
            python3-setuptools python3-setuptools-whl python3-snowballstemmer \
            python3-sphinx python3-sphinx-rtd-theme python3-tz python3-venv \
            python3.11-venv sphinx-common sphinx-rtd-theme-common
RUN git config --global url."https://github.com/tianocore/edk2-subhook.git".insteadOf https://github.com/Zeex/subhook.git