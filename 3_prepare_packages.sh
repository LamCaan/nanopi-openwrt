./scripts/feeds update -a && ./scripts/feeds install -a
rm -rf feeds/packages/libs/libcap && svn co https://github.com/openwrt/packages/trunk/libs/libcap feeds/packages/libs/libcap
sed -i '/enable-jsonc/i\\t--disable-cloud \\' feeds/packages/admin/netdata/Makefile 

cd package/lean/
if [[ `pwd` == *"rk3328"* ]]; then
  rm -rf openwrt-smartdns/ && git clone https://github.com/pymumu/openwrt-smartdns
fi
[ ! -d luci-app-adguardhome ] && git clone https://github.com/rufengsuixing/luci-app-adguardhome
rm -rf luci-theme-argon*/ ../lean/luci-theme-argon/ && git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon
rm -rf luci-app-chinadns-ng/ && git clone https://github.com/WuSiYu/luci-app-chinadns-ng
rm -rf openwrt-chinadns-ng/ && git clone https://github.com/pexcn/openwrt-chinadns-ng
rm -rf luci-app-smartdns/ && git clone -b lede https://github.com/pymumu/luci-app-smartdns.git
cd ../../

#git clone https://github.com/jerrykuku/lua-maxminddb.git
#git clone https://github.com/jerrykuku/luci-app-vssr.git
#cd luci-app-vssr/root/etc/
#echo 'china_ssr.txt
#config/black.list
#config/white.list
#dnsmasq.oversea/oversea_list.conf
#dnsmasq.ssr/ad.conf
#dnsmasq.ssr/gfw_base.conf
#dnsmasq.ssr/gfw_list.conf' | xargs rm
#cd ../../../
