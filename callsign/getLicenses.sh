#!/bin/sh

# Requires xml2

# https://www.fcc.gov/reports-research/developers/license-view-api

URL="http://data.fcc.gov/api/license-view/basicSearch/getLicenses?searchValue="
FIELDS="Licenses/License licName frn callsign categoryDesc serviceDesc statusDesc expiredDate licenseID licDetailURL"

curl --silent --show-error --location $URL$1 | xml2 | 2csv Licenses/License $FIELDS
