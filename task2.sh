#!/bin/bash

grep -rl "sample" . | \
xargs grep -l "CSC510" | \
xargs grep -o "CSC510" | \
uniq -c | \
grep -E '^[[:space:]]*3|^[[:space:]]*[4-9]|^[[:space:]]*[1-9][0-9]' | \
gawk '{print $1, $2}' | \
while read count file; do echo "$count $(ls -l ${file%:*} | gawk '{print $5}') ${file%:*}"; done | \
sort -k1,1nr -k2,2nr | \
gawk '{print $3}' | \
sed 's/file/filtered/g'