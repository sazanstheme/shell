#!/bin/sh
ip route show | grep default > /etc/vpnc/default_gw
R=`cut -d ' ' -f3 /etc/vpnc/default_gw`
vpnc /etc/vpnc/global.conf
route add default gw $R
ip route add 172.17.49.0/24 dev tun0
echo "Default GW has been changed to dev tun0 $R"
