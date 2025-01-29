#!/bin/bash
set -e

TARGET=70 
DF_ROOT=$(df / | awk '{print $5}' | sed 's/%//' | grep -v Use)

if [ "$DF_ROOT" -gt "$TARGET" ]; then
	date
	echo "Disk space is NOT OK!"
	echo "more then ${TARGET}%"
	echo "top 10 largest files:"
	du -ah / 2>/dev/null | sort -rh | head -n 10  
else
	echo "Disk space is OK!"
fi
