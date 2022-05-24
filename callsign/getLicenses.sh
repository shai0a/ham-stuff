#!/bin/sh

# Requires xml2

# Outputs CSV of liceness matching callsign

# https://www.fcc.gov/reports-research/developers/license-view-api

URL="http://data.fcc.gov/api/license-view/basicSearch/getLicenses?searchValue="
FIELDS="licName frn callsign categoryDesc serviceDesc statusDesc expiredDate licenseID licDetailURL"

if [ $# -ne 1 ]; then
	echo "Usage: $0 <callsign>" >&2
	exit 1
fi

curl --silent --show-error --location $URL$1 | xml2 | 2csv Licenses/License $FIELDS
