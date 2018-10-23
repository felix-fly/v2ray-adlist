#!/bin/bash

CONF=sr_top500_banlist_ad.conf

wget https://raw.githubusercontent.com/h2y/Shadowrocket-ADBlock-Rules/master/$CONF

cat $CONF | grep Reject|grep DOMAIN-SUFFIX|awk -F, '{print $2}' > ./site/ad
cat $CONF | grep Proxy|grep DOMAIN-SUFFIX|awk -F, '{print $2}' > ./site/gw
rm -rf ./$CONF
