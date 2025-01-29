#!/bin/bash

mkdir -p ./rand.$RANDOM
TMP_DIR = $(ls rand.*)

for i in {1..10}; do echo "Write radnom number to file: $RANDOM" > "$temp_dir/$i.txt"; done

tar -czf ./RANDOM.tar.gz -C $temp_dir .

rm -r $temp_dir
