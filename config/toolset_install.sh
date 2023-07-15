#!bash

alias ins="pacman -S --noconfirm --disable-download-timeout"

# [必要] 安装 zsh git ssh which wget
ins zsh git openssh which wget zsh-syntax-highlighting

# [非常建议] 安装 yay gcc gdb clang cmake bear 
ins yay gcc gdb clang-git cmake make bear 

# [建议] 其他开发工具
ins python ninja man-db man-pages openssh linux-headers boost cloc perf neofetch
