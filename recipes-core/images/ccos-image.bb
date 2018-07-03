DESCRIPTION = "Image with Sato, a mobile environment and visual style for \
mobile devices. The image supports X11 with a Sato theme, Pimlico \
applications, and contains terminal, editor, and file manager."

IMAGE_FEATURES += "splash package-management x11-base x11-sato ssh-server-openssh hwcodecs"

LICENSE = "MIT"

inherit core-image distro_features_check

# IMAGE_INSTALL_append = " packagegroup-core-x11-sato-games"

CORE_OS = " \
    openssh-keygen      \
    openssh-sftp-server \
    tzdata   \
    iputils  \
    iptables \
    ifupdown \
    init-ifupdown \
    dhcp-client   \
    avahi-autoipd \
    resolvconf    \
    ccos          \
"

IMAGE_INSTALL_append += " \
    ${CORE_OS} \
"

set_local_timezone() {
    ln -sf /usr/share/zoneinfo/EST5EDT ${IMAGE_ROOTFS}/etc/localtime
}

disable_bootlogd() {
    echo BOOTLOGD_ENABLE=no > ${IMAGE_ROOTFS}/etc/default/bootlogd
}

ROOTFS_POSTPROCESS_COMMAND += " \
    set_local_timezone ; \
    disable_bootlogd ; \
 "

export IMAGE_BASENAME = "ccos-image"

TOOLCHAIN_HOST_TASK += "nativesdk-perl-modules"
