#!/bin/bash

mkdir tmp
cd tmp

wget -O gw.txt https://gitlab.com/gfwlist/gfwlist/raw/master/gfwlist.txt
wget -O ad.conf https://hosts.nfz.moe/full/hosts

# gw
if [ "$(uname)" == "Darwin" ]; then
	base64 -D -i gw.txt -o gw.conf
else
	base64 -d gw.txt > gw.conf
fi
egrep '[a-z0-9][a-z0-9-]+\.[a-z0-9-]+$' gw.conf -o > gw
# add custom domain
cat ../gw.conf >> gw

# Uniq and sort gw list
sort gw | uniq > ../site/gw

# ad
grep 0.0.0.0 ad.conf |awk '{print $2}' > ad
# add custom ad hosts
cat ../ad.conf >> ad

# Remove those useful
# sed -i '' '/^l\.qq\.com$/d' ad

# Uniq and sort ad list
sort ad | uniq > ../site/ad

cd ..
rm -rf tmp
