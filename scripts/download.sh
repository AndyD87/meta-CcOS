cd yocto
. ./oe-init-build-env

bitbake -c fetchall ccsync-image
