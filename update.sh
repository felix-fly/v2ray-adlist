#!/bin/bash

mkdir tmp
cd tmp

wget -O sr.conf https://raw.githubusercontent.com/h2y/Shadowrocket-ADBlock-Rules/master/sr_top500_banlist_ad.conf
wget -O tv.conf https://raw.githubusercontent.com/vokins/yhosts/master/data/tvbox.txt

# gw
cat sr.conf | grep Proxy|grep DOMAIN-SUFFIX|awk -F, '{print $2}' > gw
cat ../gw.conf >> gw

# Uniq and sort gw list
sort gw | uniq > ../site/gw

# ad
cat sr.conf | grep Reject|grep DOMAIN-SUFFIX|awk -F, '{print $2}' > ad
# Append other ad regulations
cat tv.conf | grep 127.0.0.1|awk '{print $2}' >> ad
cat ../ad.conf >> ad

# Remove those useful
sed -i '' '/^l\.qq\.com$/d' ad
sed -i '' '/^t7z\.cupid\.iqiyi\.com$/d' ad
sed -i '' '/^api\.cupid\.iqiyi\.com$/d' ad
sed -i '' '/^store\.iqiyi\.com$/d' ad

# Uniq and sort ad list
sort ad | uniq > ../site/ad

cd ..
rm -rf tmp
