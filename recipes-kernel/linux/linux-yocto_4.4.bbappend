FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

require recipes-kernel/linux/linux-yocto.inc

COMPATIBLE_MACHINE_genericx86="genericx86"

SRC_URI_append = " file://enableIgb.cfg"

KERNEL_MODULE_AUTOLOAD_append = " igb"
