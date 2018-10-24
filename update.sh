#!/bin/bash

mkdir tmp
cd tmp

wget -O sr.conf https://raw.githubusercontent.com/h2y/Shadowrocket-ADBlock-Rules/master/sr_top500_banlist_ad.conf
wget -O tv.conf https://raw.githubusercontent.com/vokins/yhosts/master/data/tvbox.txt

# gw
cat sr.conf | grep Proxy|grep DOMAIN-SUFFIX|awk -F, '{print $2}' > gw
cat ../gw.conf >> gw

# Uniq and sort ad list
cat gw|awk '{print $1}'|uniq|sort > ../site/gw

# ad
cat sr.conf | grep Reject|grep DOMAIN-SUFFIX|awk -F, '{print $2}' > ad
# Append other ad regulations
cat tv.conf | grep 127.0.0.1|awk '{print $2}' >> ad
cat ../ad.conf >> ad

# Remove those useful
sed -i '/^l\.qq\.com$/d' ad

# Uniq and sort ad list
cat ad|awk '{print $1}'|uniq|sort > ../site/ad

cd ..
rm -rf tmp
