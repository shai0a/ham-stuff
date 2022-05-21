#!/bin/sh

# Available satellites at www.amsat.org/track/api/v1/passes.php?objects or view the options for the satellite selection in the HTML

if [ $# -ne 2 ]; then
	echo "usage: $0 <grid square> <satellite>" >&2
	exit 1
fi

# Alternatively use lat= & lng= instead of loc, where lat is latitude N and lng is longitude W
curl -F loc=${1} satellite=${2:-ISS} -F count=50 -F -F doPredict=%20Predict%20 https://www.amsat.org/track/index.php \
	| grep -A1 '<th.*Date' | sed 's/<br>/ /g' | html2text -b 0 \
	| sed 's/|/,/g'
