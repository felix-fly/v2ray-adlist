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

# Remove those useful
# if [ "$(uname)" == "Darwin" ]; then
#     sed -i '' '/^api\.cupid\.iqiyi\.com$/d' ad
# else
#     sed -i '/^api\.cupid\.iqiyi\.com$/d' ad
# fi

# Uniq and sort ad list
sort ad | uniq > ../site/ad

cd ..
rm -rf tmp
