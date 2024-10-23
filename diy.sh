#!/bin/bash

#default-settings
rm -rf package/lean/default-settings
mkdir -p package/new
git clone --depth=1 https://github.com/JohnsonRan/default-settings package/new/default-settings

#mihomo
git clone --depth=1 https://github.com/morytyann/OpenWrt-mihomo package/new/openwrt-mihomo
mkdir -p files/etc/mihomo/run/ui
curl -Lso files/etc/mihomo/run/Country.mmdb https://github.com/NobyDa/geoip/raw/release/Private-GeoIP-CN.mmdb
curl -Lso files/etc/mihomo/run/GeoIP.dat https://github.com/MetaCubeX/meta-rules-dat/releases/download/latest/geoip-lite.dat
curl -Lso files/etc/mihomo/run/GeoSite.dat https://github.com/MetaCubeX/meta-rules-dat/releases/download/latest/geosite.dat
curl -Lso metacubexd-gh-pages.tar.gz https://github.com/MetaCubeX/metacubexd/archive/refs/heads/gh-pages.tar.gz
tar zxf metacubexd-gh-pages.tar.gz
mv metacubexd-gh-pages files/etc/mihomo/run/ui/metacubexd

#qosmate
git clone https://github.com/hudra0/qosmate package/new/qosmate
git clone https://github.com/JohnsonRan/luci-app-qosmate package/new/luci-app-qosmate

# sysupgrade keep files
echo "/etc/hotplug.d/iface/*.sh" >> files/etc/sysupgrade.conf
echo "/opt" >> files/etc/sysupgrade.conf
echo "/etc/init.d/nezha-service" >> files/etc/sysupgrade.conf