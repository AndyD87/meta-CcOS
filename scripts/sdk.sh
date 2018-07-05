#!/bin/bash

# include common methods requires bash
if [ "$LIB_COMMON_INCLUDED" = "" ]; then
        source "lib.common.sh"
fi

START_DIR=$(pwd)

cd ..

if [ "$YOCTO_BRANCH" = "" ] ; then
  echo "ERROR: Yocto branch not defined"
  exit -1
fi

source poky-$YOCTO_BRANCH/oe-init-build-env
exit_on_fail "setup yocto env"

# start
bitbake ccos-image -c populate_sdk
exit_on_fail "bitbake failed to create sdk"

cd $START_DIR
