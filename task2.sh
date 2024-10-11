#!/bin/bash

grep -rl "sample" . | \
xargs grep -l "CSC510" | \
xargs grep -o "CSC510" | \
uniq -c | \
grep -E '^[[:space:]]*3|^[[:space:]]*[4-9]|^[[:space:]]*[1-9][0-9]' | \
gawk '{print $1, $2}' | \
gawk '{ "ls -l " substr($2, 1, index($2, ":")-1) " | gawk \047{print $5}\047" | getline size; print $1, size, substr($2, 1, index($2, ":")-1) }' | \
sort -k1,1nr -k2,2nr | \
gawk '{print $3}' | \
sed 's/file/filtered/g'