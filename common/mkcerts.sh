#!/bin/sh
pc=`cat pcs_13_1.txt`
for apc in $pc
do
  ./build-key $apc
done
