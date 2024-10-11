#!/bin/bash

awk -F',' '
NR > 1 && $3 == 2 && substr($13, 1, 1) == "S" {
    gsub(",male", ",M");
    gsub(",female", ",F");
    if ($7 != "") {
        total += $7;
        count++;
    }
} 
END { 
    if (count > 0) 
        print "Average Age is", total / count
    else 
        print "Average Age is N/A"
}' titanic.csv
