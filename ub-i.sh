#/data/data/com.termux/files/usr/bin/bash
echo -e "\033[34m 作者:wspbh github地址:www.github.com/wspbh
确保你的网络正常，记得关流量XD否则安装失败不怪我                                                                                       qq:1769481479
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

wget http://cdimage.ubuntu.com/ubuntu-base/releases/20.04.4/release/ubuntu-base-20.04.1-base-arm64.tar.gz
tar -xvzf ubuntu-base-20.04.1-base-arm64.tar.gz
git clone https://hub.fastgit.xyz/wspbh/ubuntu-on-phone.git
cd ubuntu-on-phone
chmod +x *
