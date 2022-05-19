#!/bin/sh

# sattid is NORAD catalog number which is an integer ranging from 1 to 43235 and counting

# Set lat, lng, loc, tz

curl -F satid=25544 -F lat= -F lng= -F loc= -F alt=0 -F tz= \
	https://www.heavens-above.com/PassSummary.aspx
	#-F __EVENTTARGET='ctl00$cph1$visible' -F __EVENTARGUMENT=radioAll \
