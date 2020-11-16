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
# Rules source
wget -O sr.conf https://raw.githubusercontent.com/h2y/Shadowrocket-ADBlock-Rules/master/sr_top500_banlist_ad.conf
# Another ad source
wget -O hosts https://cdn.jsdelivr.net/gh/neoFelhz/neohosts@gh-pages/basic/hosts
# A larger ad source from anti-ad
wget -O anti https://anti-ad.net/anti-ad-for-dnsmasq.conf
# Custom gw source
wget -O gw.conf https://raw.githubusercontent.com/felix-fly/v2ray-dnsmasq-dnscrypt/master/config/gw.conf
# Custom ad source
wget -O ad.conf https://raw.githubusercontent.com/felix-fly/v2ray-dnsmasq-dnscrypt/master/config/ad.conf
# Custom ad blank list
wget -O ad_blank.conf https://raw.githubusercontent.com/felix-fly/v2ray-dnsmasq-dnscrypt/master/config/ad_blank.conf

# gw
cat sr.conf | grep Proxy|grep DOMAIN-SUFFIX|awk -F, '{print $2}' > gw
# add custom domain
cat gw.conf >> gw

# Uniq and sort gw list
sort -u -o ../site/gw gw

# Combine all ad source
cat sr.conf | grep Reject|grep DOMAIN-SUFFIX|awk -F, '{print $2}' > ad
cat hosts | grep 0.0.0.0|awk '{print $2}' >> ad
cat ad.conf >> ad

# remove the first dot ex: .abc.com
sed -i.bak 's/^\.//g' ad
rm ad.bak

# Uniq and sort ad list
sort -u -o ad ad

# Allow ad in blank list
comm -2 -3 ad ad_blank.conf > ../site/ad

cd ..
buildSite site.dat

# Include anti-ad
cd tmp
cat anti | grep address=/|awk -F/ '{print $2}' >> ad
sort -u -o ad ad
comm -2 -3 ad ad_blank.conf > ../site/ad

cd ..
buildSite site-full.dat

rm -rf tmp site
