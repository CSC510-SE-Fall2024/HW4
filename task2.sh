#!/bin/bash

grep -rl "sample" . | \
xargs grep -l "CSC510" | \
xargs grep -o "CSC510" | \
uniq -c | grep -E '^[[:space:]]*3|^[[:space:]]*[4-9]|^[[:space:]]*[1-9][0-9]' | \
sort -r | \
gawk '{print $2}' | \
sed 's/file/filtered/g'