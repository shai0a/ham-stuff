#!/bin/sh

# https://www.n2yo.com/api/

API_KEY=
MY_LAT=
MY_LNG=
MY_ALT=
DAYS=10			# days to predict; max 10
SAT_MIN_EL=40
DATE_FMT="%x %T %Z"
SAT_NAME=$1
SAT_ID=$2		# INRAD ID

API_URL="https://api.n2yo.com/rest/v1/satellite/radiopasses/$SAT_ID/$MY_LAT/$MY_LNG/$MY_ALT/$DAYS/$SAT_MIN_EL/&apiKey=$API_KEY"

curl -s $API_URL \
	| tee $SAT_NAME.json \
	| jq -r '.passes | map(. + {sat:"'$SAT_NAME'"}) | (map(keys) | add | unique) as $cols | $cols, map(. as $row | $cols | map($row[.]))[] | @csv' \
	| awk -F "," -v date="$DATE_FMT" '{OFS=","; if (NR==1){gsub(/UTC/,"")} else {for(i=1;i<=NF;i++){if ($i~/[0-9]{10}/) {$i=strftime(date,$i)}}}; print $0}' \
	> $SAT_NAME.csv
