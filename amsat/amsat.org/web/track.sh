#!/bin/sh

# Available satellites at www.amsat.org/track/api/v1/passes.php?objects or view the options for the satellite selection in the HTML

if [ $# -lt 2 ]; then
	echo "usage: $0 <grid square> <satellite>" >&2
	exit 1
fi

loc=$(printf '%s\n' "$1" | awk '{print toupper($1)}')
sat=$(printf '%s\n' "$2" | awk '{print toupper($1)}')

# Alternatively use lat= & lng= instead of loc, where lat is latitude N and lng is longitude W
curl -s -F loc=$loc -F satellite=$sat -F count=50 -F doPredict=%20Predict%20 https://www.amsat.org/track/index.php \
	| grep -A1 '<th.*Date' | sed 's/<br>/ /g' | html2text -b 0 \
	| sed 's/|/,/g'
