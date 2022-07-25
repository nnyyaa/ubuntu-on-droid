#/data/data/com.termux/files/usr/bin/bash
echo -e "\033[34m 作者:wspbh github地址:www.github.com/wspbh
确保你的网络正常，记得关流量XD否则安装失败不怪我
qq:1769481479
目前只支持ubuntu22.04LTS版本\033[0m"
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
wget https://mirrors.bfsu.edu.cn/ubuntu-cdimage/ubuntu-base/releases/22.04/release/ubuntu-base-22.04-base-arm64.tar.gz
mkdir ubuntu-fs
mv ubuntu-base-22.04-base-arm64.tar.gz ubuntu-fs
cd ubuntu-fs
tar -xvzf ubuntu-base-22.04-base-arm64.tar.gz
chmod 777 ~/ubuntu-on-phone/*
mv ~/ubuntu-on-phone/startubuntu $PREFIX/bin
cd ~
cd ubuntu-fs/etc/
rm resolv.conf apt/sources.list
mv ~/ubuntu-on-phone/resolv.conf .
mv ~/ubuntu-on-phone/sources.list apt/
cd ~
read -n1 -p "需要伪造proc文件吗?(无root推荐选择)  [输Y以伪造/任意键取消]?" answer
case $answer in
Y | y )
echo '伪造脚本用了moe大佬的脚本'
sleep 3
mkdir proot_proc
wget https://gitee.com/yudezeng/proot_proc/raw/master/proc.tar.xz
sleep 1
mkdir tmp
echo 正在解压伪造文件
tar xJf proc.tar.xz -C tmp 
echo 复制文件
cp -r tmp/usr/local/etc/tmoe-linux/proot_proc/ ubuntu-fs/proot_proc
rm -rf ubuntu-fs/proc
mv ubuntu-fs/proot_proc/ ubuntu-fs/proc
rm -rf proot_proc tmp 
rm -rf proc.tar.xz;;
*)
      echo '不伪造';;
esac

clear
echo '完成！'
echo '输入startubuntu来启动ubuntu!'
read -p '按任意键退出!'
