#!/bin/bash

function buildSite() {
    # generate site.dat file
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        # linux
        chmod +x ./v2sitedat
        ./v2sitedat -dat ./$1 -dir ./site
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        # mac
        chmod +x ./v2sitedat_darwin
        rm ./site/.DS_Store
        ./v2sitedat_darwin -dat ./$1 -dir ./site
    elif [[ "$OSTYPE" == "win32" ]]; then
        # windows
        ./v2sitedat32.exe -dat ./$1 -dir ./site
    fi
}

mkdir tmp
mkdir site
cd tmp
wget -O ad.hosts https://raw.githubusercontent.com/felix-fly/v2ray-dnsmasq-dnscrypt/master/ad.hosts
wget -O gw.hosts https://raw.githubusercontent.com/felix-fly/v2ray-dnsmasq-dnscrypt/master/gw.hosts

# gw
cat gw.hosts | awk -F/ '{print $2}' > ../site/gw

# ad
cat ad.hosts | awk -F/ '{print $2}' > ../site/ad

cd ..
buildSite site.dat

rm -rf tmp site
