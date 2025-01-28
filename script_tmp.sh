#!/bin/bash
set -e

TARGET=70 
DF_ROOT=$(df / | awk '{print $5}' | sed 's/%//' | grep -v Use)

if [ "$DF_ROOT" -gt "$TARGET" ]; then
        date
        echo "Места на диске не достаточно"
        echo "Доступно меньше $TARGET %"
        du -ah / | sort -rh | head -n 10 

else
        echo "Места на диске достаточно"
        echo "Места на диске достаточно"
fi