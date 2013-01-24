#!/bin/bash
FILES="$@"
for i in $FILES
do
echo "Processing image $i ..."
#convert -thumbnail 150x150 $i $i.thumb
convert $i -thumbnail '150x150>' -gravity center -extent 150x150 $i.thumb
done
