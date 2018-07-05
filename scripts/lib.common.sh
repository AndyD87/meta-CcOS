#!/bin/bash
# lib.common.h
# This script contains common methods ready to include
# for other scripts

LIB_COMMON_INCLUDED="1"

if [ ! "$BASH_VERSION" ] ; then
    echo "Please execute this script directly or with bash" 1>&2
    exit 1
fi

function exit_on_fail () {
  if [ $? -ne 0 ]; then
    MESSAGE="Last command failed with $?"
    if [ -n "$1" ]
    then
      MESSAGE="$1"
    fi
    echo "$MESSAGE"
    exit 111;
  fi
}
