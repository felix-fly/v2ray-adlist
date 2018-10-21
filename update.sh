#!/bin/bash

cd list

wget https://raw.githubusercontent.com/h2y/Shadowrocket-ADBlock-Rules/master/sr_top500_banlist_ad.conf

cat sr_top500_banlist_ad.conf | grep Reject|grep DOMAIN-SUFFIX|awk -F, '{print $2}' > ad
cat sr_top500_banlist_ad.conf | grep Proxy|grep DOMAIN-SUFFIX|awk -F, '{print $2}' > gw
rm -rf ./*.conf
