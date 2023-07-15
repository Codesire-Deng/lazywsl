#!bash

echo "toolset_install..."

function inst {
    pacman -S --noconfirm --disable-download-timeout $@
}

sync

# [必要] 安装 zsh git ssh which wget
inst zsh git openssh which wget

# [非常建议] 安装 yay gcc gdb clang cmake bear 
inst yay gcc gdb clang-git cmake make bear

# [建议] 其他开发工具
inst python ninja man-db man-pages openssh linux-headers zsh-syntax-highlighting boost cloc perf neofetch
