#!/bin/sh

EXTRA_CFLAGS="-Wno-deprecated-declarations -Wno-address-of-packed-member \
              -Wno-stringop-truncation -Wno-stringop-overflow \
              -Wno-format-truncation -Wno-format-overflow"

if [ ! -d build ]; then
    mkdir build
fi

cd build
../configure --python=$(which python3) --extra-cflags="$EXTRA_CFLAGS" \
            --target-list="x86_64-softmmu, i386-softmmu" --enable-serialice \
            --disable-bzip2 --disable-cap-ng --disable-cocoa --disable-curl \
            --disable-gcrypt --disable-glusterfs --disable-gtk \
            --disable-gnutls --disable-guest-agent --disable-guest-agent-msi \
            --disable-kvm --disable-libiscsi --disable-libnfs \
            --disable-libusb --disable-lzo --disable-netmap \
            --disable-nettle --disable-opengl --disable-rbd --disable-rdma \
            --disable-sdl --disable-seccomp --disable-slirp --disable-spice \
            --disable-smartcard --disable-snappy --disable-tools \
            --disable-usb-redir --disable-vde \
            --disable-vhost-net --disable-virglrenderer \
            --disable-virtfs --disable-vnc --disable-vte --disable-xen

if [ $? -eq 0 ]; then
    make -j$(nproc)
fi
