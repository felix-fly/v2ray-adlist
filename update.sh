#!/bin/bash

mkdir tmp
cd tmp

wget -O sr.conf https://raw.githubusercontent.com/h2y/Shadowrocket-ADBlock-Rules/master/sr_top500_banlist_ad.conf

# gw
cat sr.conf | grep Proxy|grep DOMAIN-SUFFIX|awk -F, '{print $2}' > gw
# add custom domain
cat ../gw.conf >> gw

# Uniq and sort gw list
sort gw | uniq > ../site/gw

# ad
cat sr.conf | grep Reject|grep DOMAIN-SUFFIX|awk -F, '{print $2}' > ad
# add custom ad hosts
cat ../ad.conf >> ad

# Uniq and sort ad list
sort -u -o ad ad

# Allow ad in blank list
comm -2 -3 ad ../ad_blank.conf > ../site/ad

cd ..
rm -rf tmp

# generate site.dat file
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # linux
    chmod +x ./v2sitedat
    ./v2sitedat -dat ./site.dat -dir ./site
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # mac
    chmod +x ./v2sitedat_darwin
    ./v2sitedat_darwin -dat ./site.dat -dir ./site
elif [[ "$OSTYPE" == "win32" ]]; then
    # windows
    ./v2sitedat32.exe -dat ./site.dat -dir ./site
fi
