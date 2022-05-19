#!/bin/sh

# Available satellites at www.amsat.org/track/api/v1/passes.php?objects or view the options for the satellite selection in the HTML

LOC=	# grid square

# Alternatively use lat= & lng= instead of loc, where lat is latitude N and lng is longitude W
curl -F satellite=${1:-ISS} -F count=50 -F loc=$LOC -F doPredict=%20Predict%20 https://www.amsat.org/track/index.php \
	| grep -A1 '<th.*Date' | sed 's/<br>/ /g' | html2text -b 0 \
	| sed 's/|/,/g'
