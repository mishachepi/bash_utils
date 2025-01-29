#!/bin/bash
set -e

mkdir -p /opt/281024-wdm/mikhail_chepkin/tmp_2
TMP_DIR=/opt/281024-wdm/mikhail_chepkin/tmp_2

for i in {1..10}
  do
    date '+%T' > $TMP_DIR/$i.txt
    sleep 0.5
  done
 tar -cvzf mydir2.tar.gz $TMP_DIR
