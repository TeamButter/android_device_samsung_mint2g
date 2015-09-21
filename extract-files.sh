#!/bin/sh

BASE=../../../vendor/samsung/mint/proprietary
rm -rf $BASE/*

for FILE in `egrep -v '(^#|^$)' proprietary-files.txt`; do
  DIR=`dirname $FILE`
  if [ ! -d $BASE/$DIR ]; then
    mkdir -p $BASE/$DIR
  fi
  # My way of pulling blobs without the device
  echo "Pulling\\033[33m $FILE\033[m"
  cp $1/system/$FILE $BASE/$FILE
done

./setup-makefiles.sh
