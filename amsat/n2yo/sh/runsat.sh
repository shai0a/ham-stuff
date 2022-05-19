#!/bin/sh

xargs -a sat.txt -rL1 ./sat.sh

# Concatenate CSV files
awk 'BEGIN{f=0} {if ($1~/endAz/) {if (!f) {print; f++}} else {print}}' *.csv | tee `date +%Y-%m-%d.csv`
