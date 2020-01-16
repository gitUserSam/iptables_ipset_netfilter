#!/bin/sh
#调试脚本,安装完毕，dmesg查看

function uninstall_netfilter_module()
{
	/usr/libexec/iptables/iptables.init stop
	rmmod iptable_filter.ko
	rmmod iptable_raw.ko
	rmmod iptable_security.ko
	rmmod iptable_mangle.ko
	rmmod iptable_nat.ko
	rmmod ip_tables.ko
	make CONFIG_IP_NF_IPTABLES=m -C /usr/src/linux-3.2.1  M=`pwd` modules
}

function install_netfilter_module()
{
	insmod ip_tables.ko
	insmod iptable_raw.ko
	insmod iptable_security.ko
	insmod iptable_mangle.ko
	insmod iptable_nat.ko
	insmod iptable_filter.ko
}

main()
{
	uninstall_netfilter_module;
	sleep 1;
	install_netfilter_module;
}

main;
