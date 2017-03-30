DESCRIPTION = "A console-only image with more full-featured Linux system \
functionality installed."

CORE_IMAGE_EXTRA_INSTALL += "dhcp-server dhcp-client"

IMAGE_FEATURES += "ssh-server-openssh"

IMAGE_INSTALL = "\
    packagegroup-core-boot \
    packagegroup-core-full-cmdline \
    ${CORE_IMAGE_EXTRA_INSTALL} \
    kernel-modules \
    vim \
    CcOS \
    "

inherit core-image
