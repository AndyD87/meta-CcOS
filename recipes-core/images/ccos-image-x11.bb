DESCRIPTION = "Image with Sato, a mobile environment and visual style for \
mobile devices. The image supports X11 with a Sato theme, Pimlico \
applications, and contains terminal, editor, and file manager."

IMAGE_FEATURES += "splash package-management x11-base"

LICENSE = "MIT"

inherit core-image distro_features_check

CORE_OS = " \
    openssh-keygen      \
    openssh-sftp-server \
    iputils  \
    iptables \
    ifupdown \
    init-ifupdown \
    dhcp-client   \
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

IMAGE_BASENAME = "ccos-image-x11"

TOOLCHAIN_HOST_TASK += "nativesdk-perl-modules"
