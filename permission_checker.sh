#!/bin/bash

DIR='.'

FILE_LIST=$(find "$DIR" -type f -name "*.sh")
for FILE in $FILE_LIST
do
	chmod u+x "$FILE"
done

