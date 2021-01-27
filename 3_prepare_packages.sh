./scripts/feeds update -a && ./scripts/feeds install -a
rm -rf feeds/packages/libs/libcap/ && svn co https://github.com/openwrt/packages/trunk/libs/libcap feeds/packages/libs/libcap
rm -rf feeds/packages/lang/golang/ && svn co https://github.com/coolsnowwolf/packages/trunk/lang/golang feeds/packages/lang/golang
sed -i '/enable-jsonc/i\\t--disable-cloud \\' feeds/packages/admin/netdata/Makefile 

#R2S相关
wget -P target/linux/generic/pending-5.4 https://github.com/project-openwrt/openwrt/raw/master/target/linux/generic/pending-5.4/312-arm64-cpuinfo-Add-model-name-in-proc-cpuinfo-for-64bit-ta.patch
#3328 add idle
wget -P target/linux/rockchip-rk3328/patches-5.4 https://github.com/coolsnowwolf/lede/raw/master/target/linux/rockchip/patches-5.4/005-arm64-dts-rockchip-Add-RK3328-idle-state.patch
#交换LAN WAN
sed -i 's,"eth1" "eth0","eth0" "eth1",g' target/linux/rockchip-rk3328/base-files/etc/board.d/02_network
sed -i "s,'eth1' 'eth0','eth0' 'eth1',g" target/linux/rockchip-rk3328/base-files/etc/board.d/02_network

cd package/lean/
if [[ `pwd` == *"rk3328"* ]]; then
  rm -rf openwrt-smartdns/ && git clone https://github.com/pymumu/openwrt-smartdns
fi
[ ! -d luci-app-adguardhome ] && git clone https://github.com/rufengsuixing/luci-app-adguardhome
rm -rf luci-theme-argon*/ ../lean/luci-theme-argon/ && git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon
rm -rf luci-app-chinadns-ng/ && git clone https://github.com/WuSiYu/luci-app-chinadns-ng
rm -rf openwrt-chinadns-ng/ && git clone https://github.com/pexcn/openwrt-chinadns-ng
rm -rf luci-app-smartdns/ && git clone -b lede https://github.com/pymumu/luci-app-smartdns.git
rm -rf v2ray/ && svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/v2ray
#rm -rf v2ray-plugin/ && svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/v2ray-plugin
rm -rf trojan/ && svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/trojan
svn co https://github.com/songchenwen/nanopi-r2s/trunk/luci-app-r2sflasher
#serverchan
git clone -b master --depth 1 https://github.com/tty228/luci-app-serverchan.git package/new/luci-app-serverchan
svn co https://github.com/openwrt/openwrt/branches/openwrt-19.07/package/network/utils/iputils package/network/utils/iputil

#流量监视
git clone -b master --depth 1 https://github.com/brvphoenix/wrtbwmon.git package/new/wrtbwmon
git clone -b master --depth 1 https://github.com/brvphoenix/luci-app-wrtbwmon.git package/new/luci-app-wrtbwmon

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
