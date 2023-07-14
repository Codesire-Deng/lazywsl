#!bash

echo "waiting for filesystem..."
sleep 1s

# 初始化 sudoers
cp ./config/sudoers /etc/sudoers

# 添加 pacman 清华源
cp ./config/pacman.conf /etc/pacman.conf
sleep 3s

while true; do
    pacman-key --init && sleep 1s && pacman-key --populate archlinux && sleep 1s && break
done

while true; do
    pacman -Sy --noconfirm --disable-download-timeout archlinux-keyring && sleep 2s && break
done

while true; do
    pacman -Sy --noconfirm --disable-download-timeout archlinuxcn-keyring && sleep 2s && break
done

pacman -Syu --noconfirm --disable-download-timeout
