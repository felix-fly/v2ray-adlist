#!/bin/bash

mkdir tmp
cd tmp

wget -O sr.conf https://raw.githubusercontent.com/h2y/Shadowrocket-ADBlock-Rules/master/sr_top500_banlist_ad.conf

# gw
cat sr.conf | grep Proxy|grep DOMAIN-SUFFIX|awk -F, '{print $2}' > gw
# add custom domain
cat ../gw.conf >> gw

# Uniq and sort gw list
sort -u -o ../site/gw gw

# ad
cat sr.conf | grep Reject|grep DOMAIN-SUFFIX|awk -F, '{print $2}' > ad
# add custom ad hosts
cat ../ad.conf >> ad

# Uniq and sort ad list
sort -u -o ad ad

# Allow ad in blank list
comm -2 -3 ad ../ad_blank.conf > ../site/ad

# Export the mini version for gw
rm ../mini/gw
cat ../site/gw | grep amazonaws >> ../mini/gw
cat ../site/gw | grep google >> ../mini/gw
cat ../site/gw | grep blogspot >> ../mini/gw
cat ../site/gw | grep youtube >> ../mini/gw
cat ../site/gw | grep facebook >> ../mini/gw
cat ../site/gw | grep twitter >> ../mini/gw
cat ../site/gw | grep dropbox >> ../mini/gw
cat ../site/gw | grep github >> ../mini/gw
cat ../site/gw | grep v2ex >> ../mini/gw
cat ../site/gw | grep v2ray >> ../mini/gw
cat ../site/gw | grep cdn >> ../mini/gw
sort -u -o ../site/gw ../site/gw

# Another smaller ad hosts
wget -O hosts https://cdn.jsdelivr.net/gh/neoFelhz/neohosts@gh-pages/basic/hosts
cat hosts | grep 0.0.0.0|awk '{print $2}' > ad-mini
cat ../ad.conf >> ad-mini
sort -u -o ad-mini ad-mini
comm -2 -3 ad-mini ../ad_blank.conf > ../mini/ad

cd ..
rm -rf tmp

# generate site.dat file
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # linux
    chmod +x ./v2sitedat
    ./v2sitedat -dat ./site.dat -dir ./site
    ./v2sitedat -dat ./mini.dat -dir ./mini
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # mac
    chmod +x ./v2sitedat_darwin
    ./v2sitedat_darwin -dat ./site.dat -dir ./site
    ./v2sitedat_darwin -dat ./mini.dat -dir ./mini
elif [[ "$OSTYPE" == "win32" ]]; then
    # windows
    ./v2sitedat32.exe -dat ./site.dat -dir ./site
    ./v2sitedat32.exe -dat ./mini.dat -dir ./mini
fi

