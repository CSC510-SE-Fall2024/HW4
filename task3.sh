#!/bin/bash

gawk -F, 'NR > 1 && $3 == 2 && substr($13, 1, 1) == "S" { print }' titanic.csv |
sed 's/female/F/g; s/male/M/g' |
gawk -F, '{ if ($7 != "") { total_age += $7; num_passengers++ } }
           END { if (num_passengers > 0) print "The average age is: ", total_age / num_passengers; 
                 else print "The average age is: N/A" }'
