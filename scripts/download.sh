#!/bin/bash

# include common methods requires bash
if [ "$LIB_COMMON_INCLUDED" = "" ]; then
        source "lib.common.sh"
fi

START_DIR=$(pwd)

# Change to top of meta
cd ..

if [ "$YOCTO_BRANCH" = "" ] ; then
  echo "ERROR: Yocto branch not defined"
  exit -1
fi

# clone main repository [$YOCTO_BRANCH] and enter directory
if [ -d poky-$YOCTO_BRANCH ]; then
  echo "update poky-$YOCTO_BRANCH"
  cd poky-$YOCTO_BRANCH
  git pull
else
  echo "download poky-$YOCTO_BRANCH"
  git clone -b $YOCTO_BRANCH git://git.yoctoproject.org/poky.git poky-$YOCTO_BRANCH
  cd poky-$YOCTO_BRANCH
fi
exit_on_fail

cd $START_DIR
