#!/bin/bash

VAR=$(ls -l)

for i in $(ls -l | awk '{print $9  $1  $5}') 
do
	echo $i
done

