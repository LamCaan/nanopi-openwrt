./scripts/feeds update -a && ./scripts/feeds install -a
rm -rf feeds/packages/libs/libcap/ && svn co https://github.com/openwrt/packages/trunk/libs/libcap feeds/packages/libs/libcap
rm -rf feeds/packages/lang/golang/ && svn co https://github.com/coolsnowwolf/packages/trunk/lang/golang feeds/packages/lang/golang
sed -i '/enable-jsonc/i\\t--disable-cloud \\' feeds/packages/admin/netdata/Makefile 

#交换LAN WAN
sed -i 's,"eth1" "eth0","eth0" "eth1",g' target/linux/rockchip-rk3328/base-files/etc/board.d/02_network
sed -i "s,'eth1' 'eth0','eth0' 'eth1',g" target/linux/rockchip-rk3328/base-files/etc/board.d/02_network

cd package/lean/
if [[ `pwd` == *"rk3328"* ]]; then
  rm -rf openwrt-smartdns/ && git clone https://github.com/pymumu/openwrt-smartdns
fi
[ ! -d luci-app-adguardhome ] && git clone https://github.com/rufengsuixing/luci-app-adguardhome
rm -rf luci-theme-argon*/ ../lean/luci-theme-argon/ && git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon
#rm -rf luci-app-chinadns-ng/ && git clone https://github.com/WuSiYu/luci-app-chinadns-ng
#rm -rf luci-app-chinadns-ng/ && git clone -b luci https://github.com/pexcn/openwrt-chinadns-ng.git luci-app-chinadns-ng
#rm -rf openwrt-chinadns-ng/ && git clone https://github.com/pexcn/openwrt-chinadns-ng && sed -i 's/\$(PKG_BUILD_DIR)\/chinadns-ng-update-list\.sh/files\/chinadns-ng-update-list\.sh/g' openwrt-chinadns-ng/Makefile
rm -rf luci-app-smartdns/ && git clone -b lede https://github.com/pymumu/luci-app-smartdns.git
#rm -rf v2ray/ && svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/v2ray
#rm -rf v2ray-plugin/ && svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/v2ray-plugin
#rm -rf trojan/ && svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/trojan
rm -rf adbyby/
rm -rf luci-app-adbyby-plus/
svn co https://github.com/songchenwen/nanopi-r2s/trunk/luci-app-r2sflasher
cd ../../

rm -rf feeds/helloworld/luci-app-ssr-plus
rm -rf package/feeds/helloworld/luci-app-ssr-plus

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
