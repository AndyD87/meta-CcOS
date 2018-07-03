#!/bin/bash

# include common methods requires bash
source "lib.common.sh"

# Change to top of meta
cd ..

if [ "$YOCTO_BRANCH" = "" ] ; then
  echo "ERROR: Yocto branch not defined"
  exit -1
fi

#################################################################################
# Load paths to configs
#################################################################################
cp conf/bblayers.conf.in conf/bblayers.conf
exit_on_fail "Failed to copy bblayers.conf"

newpath=$PWD
newpath=${newpath////\\/} # escape path /home/test -> \/home\/test
sed -i conf/bblayers.conf -e 's/${HOME}/'$newpath'/g'
sed -i conf/bblayers.conf -e 's/${YOCTO_BRANCH}/'$YOCTO_BRANCH'/g'
exit_on_fail "Failed to sed bblayers.conf"
