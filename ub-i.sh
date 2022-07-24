#/data/data/com.termux/files/usr/bin/bash
echo -e "\033[34m 作者:wspbh github地址:www.github.com/wspbh
确保你的网络正常，记得关流量XD否则安装失败不怪我
qq:1769481479
目前只支持ubuntu20.04.4LTS版本\033[0m"
read -p '按回车以开始安装'
read -n1 -p "你想将源改为bfsu国内源吗?(推荐更改)   [输Y以更改/任意键不更改]?" answer
case $answer in
Y | y )                                               
      sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://mirrors.bfsu.edu.cn/termux/termux-packages-24 stable main@' $PREFIX/etc/apt/sources.list;;
*)
      echo '不换源';;
esac

cd ~
apt update
apt upgrade
apt install git tar zip unzip wget curl -y
echo '蹦蹦炸弹~嘿咻
马上开始~'
sleep 2
wget https://mirrors.bfsu.edu.cn/ubuntu-cdimage/ubuntu-base/releases/20.04.4/release/ubuntu-base-20.04.4-base-arm64.tar.gz
mkdir ubuntu-fs
mv ubuntu-base-20.04.4-base-arm64.tar.gz ubuntu-fs
cd ubuntu-fs
tar -xvzf ubuntu-base-20.04.4-base-arm64.tar.gz
chmod 777 ~/ubuntu-on-phone/*
mv ~/ubuntu-on-phone/startubuntu $PREFIX/bin
cd ~
cd ubuntu-fs/etc/
rm resolv.conf apt/sources.list
mv ~/ubuntu-on-phone/resolv.conf .
mv ~/ubuntu-on-phone/sources.list apt/
clear
echo '完成！'
echo '输入startubuntu来启动ubuntu!'
read -p '按任意键退出
