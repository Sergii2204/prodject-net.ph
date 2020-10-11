#! /bin/bash

#type=$(cat /etc/sysconfig/network-scripts/ifcfg-enp0s3 | grep "TYPE=")
#echo "$type" >> /home/network.txt

#sed -i "s/dhsp/static/g" /home/network.txt
#sed -i "s/ONBOOT=no/ONBOOT=yes/g" /home/network.txt

if cat /etc/sysconfig/network-scripts/ifcfg-enp0s3 | grep "BOOTPROTO=\dhsp"; then
echo "We have bootproto =dhsp"
sed -i "s/BOOTPROTO=.*/BOOTPROTO=static/g" /etc/sysconfig/network-scripts/ifcfg-enp0s3
fi

if cat /etc/sysconfig/network-scripts/ifcfg-enp0s3 | grep "ONBOOT=\no"; then
echo "We have ondoot =no"
sed -i "s/ONBOOT=no/ONBOOT=yes/g" /etc/sysconfig/network-scripts/ifcfg-enp0s3
fi


read -r -p "Enter ip address " ip
if [[ $ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then

if cat /etc/sysconfig/network-scripts/ifcfg-enp0s3 | grep "IPADDR=.*"; then
echo "We have IPADDR="
sed -i "s/IPADDR=.*/IPADDR=$ip/g" /etc/sysconfig/network-scripts/ifcfg-enp0s3
else
echo "IPADDR=$ip" >> /etc/sysconfig/network-scripts/ifcfg-enp0s3
fi
else
echo "Invalid IP address"
exit 1
fi


read -r -p "Enter default 255.255.255.0 NETMASK address " netmask
if cat /etc/sysconfig/network-scripts/ifcfg-enp0s3 | grep "NETMASK=.*"; then
echo "We have NETMASK$gateway"
sed -i "s/NETMASK=.*/NETMASK=$gateway/g" /etc/sysconfig/network-scripts/ifcfg-enp0s3
if [[ $gateway=="" ]]; then
sed -i "s/NETMASK=.*/NETMASK=255.255.255.0/g" /etc/sysconfig/network-scripts/ifcfg-enp0s3
else 
echo "NETMASK=$gateway" >> /etc/sysconfig/network-scripts/ifcfg-enp0s3
fi
fi


read -r -p "Enter GATEWAY= address " gateway

if [[ $gateway =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
if cat /etc/sysconfig/network-scripts/ifcfg-enp0s3 | grep "GATEWAY=.*"; then
echo "We have GATEWAY=$netmask"
sed -i "s/GATEWAY=.*/GATEWAY=$netmask/g" /etc/sysconfig/network-scripts/ifcfg-enp0s3
else
echo "GATEWAY=$netmask" >> /etc/sysconfig/network-scripts/ifcfg-enp0s3
fi
else
echo "Invalid IP address"
exit 1
fi



read -r -p "Enter default 8.8.8.8 DNS1= address " dns1
if cat /etc/sysconfig/network-scripts/ifcfg-enp0s3 | grep "DNS1=.*"; then
echo "We have DNS1=$dns1"
sed -i "s/DNS1=.*/DNS1=$dns1/g" /etc/sysconfig/network-scripts/ifcfg-enp0s3
if [[ $dns1=="" ]]; then
sed -i "s/DNS1=.*/DNS1=8.8.8.8/g" /etc/sysconfig/network-scripts/ifcfg-enp0s3
else
echo "DNS1=$dns1" >> /etc/sysconfig/network-scripts/ifcfg-enp0s3
fi
fi

read -r -p "Enter default 8.8.4.4 DNS2= address " dns2
if cat /etc/sysconfig/network-scripts/ifcfg-enp0s3 | grep "DNS2=.*"; then
echo "We have DNS2=$dns2"
sed -i "s/DNS2=.*/DNS2=$dns2/g" /etc/sysconfig/network-scripts/ifcfg-enp0s3
if [[ $dns2=="" ]]; then
sed -i "s/DNS2=.*/DNS2=8.8.4.4/g" /etc/sysconfig/network-scripts/ifcfg-enp0s3
else
echo "DNS2=$dns2" >> /etc/sysconfig/network-scripts/ifcfg-enp0s3
fi
fi