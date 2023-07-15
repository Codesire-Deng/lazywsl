#!bash

echo "waiting for filesystem..."
sync
sleep 3s

# 初始化 sudoers
cp ./config/sudoers /etc/sudoers

# 添加 pacman 清华源
cp ./config/pacman.conf /etc/pacman.conf
sync
sleep 3s

while true; do
    rm -rf /etc/pacman.d/gnupg \
    && sync && sleep 3s \
    && pacman-key --init \
    && echo "waiting for filesystem..." \
    && sync && sleep 3s \
    && pacman-key --populate archlinux && sync && break
done
sleep 5s

while true; do
    pacman -Sy --noconfirm --disable-download-timeout archlinux-keyring && sync && sleep 3s && break
done

while true; do
    pacman -Sy --noconfirm --disable-download-timeout archlinuxcn-keyring && sync && sleep 3s && break
done

pacman -Syu --noconfirm --disable-download-timeout
sleep 5s
