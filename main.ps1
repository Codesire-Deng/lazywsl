$username = Read-Host "Linux username"
$password = Read-Host "Linux password" -MaskInput

# 在错误时停止
$ErrorActionPreference = "Stop"

# pacman 安装指令
$install = "pacman -S --noconfirm --disable-download-timeout"

# 初始化 wsl
.\Arch.exe

# 初始化 archlinux
.\Arch.exe

# 确认 wsl 正常
.\Arch.exe run bash -c "exit"

# 初始化 sudoers
.\Arch.exe run bash -c "cp ./config/sudoers /etc/sudoers" 

# 添加 pacman 清华源
.\Arch.exe run bash -c "cp ./config/pacman.conf /etc/pacman.conf"

# 更新 keyring 和系统软件
.\Arch.exe run bash -c "pacman-key --init && pacman-key --populate && pacman -Sy --noconfirm --disable-download-timeout archlinux-keyring archlinuxcn-keyring && pacman -Su --noconfirm --disable-download-timeout"

# [必要] 安装 zsh git which wget
.\Arch.exe run bash -c "$install zsh git which wget zsh-syntax-highlighting"

# [非常建议] 安装 yay gcc clang cmake bear 
.\Arch.exe run bash -c "$install yay gcc clang-git cmake make bear"

# [建议] 其他开发工具
.\Arch.exe run bash -c "$install gdb python ninja man-db man-pages openssh linux-headers boost cloc perf neofetch"

# 添加 user
.\Arch.exe run bash -c "useradd -m -G wheel -s `$(which zsh) $username"

# 设定 root 密码
.\Arch.exe run bash -c "echo 'root:$password' | chpasswd"

# 设定 user 密码
.\Arch.exe run bash -c "echo '$username`:$password' | chpasswd"

# sudo 免密
.\Arch.exe run bash -c "echo '$username ALL=(ALL:ALL) NOPASSWD: ALL' > /etc/sudoers.d/00_$username"

# 将 wsl 默认用户从 root 改为 username
.\Arch.exe config --default-user $username

# [建议] 防止 git init 抱怨
.\Arch.exe run bash -c "git config --global init.defaultBranch main"

# [建议] 安装 pip
.\Arch.exe run bash -c "echo 'export PATH=\`$HOME/.local/bin:\`$PATH' >> ~/.bash_profile"
.\Arch.exe run bash -c "python -m ensurepip --upgrade"
.\Arch.exe run bash -c "cd ~/.local/bin && ln -s ./pip3 pip"

# 安装并配置 oh-my-zsh
.\Arch.exe run bash -c "cd && rm -rf .oh-my-zsh .zsh* && RUNZSH='no' sh `$(pwd)/config/ohmyzsh_install.sh"
.\Arch.exe run bash -c "cp ./config/robbyrussell.zsh-theme ~/.oh-my-zsh/custom/robbyrussell.zsh-theme"
.\Arch.exe run bash -c "cp ./config/.zshrc ~/.zshrc"

# 拷贝 C++ 样例工程
.\Arch.exe run bash -c "mkdir ~/dev"
.\Arch.exe run bash -c "cp -r ./config/TemplateRepoCxx ~/dev/TemplateRepoCxx"

# 拷贝并执行 vscode 脚本
.\Arch.exe run bash -c "cp ./config/vscode_install.sh ./config/settings.json ~/dev"
.\Arch.exe run bash -c "cd && bash dev/vscode_install.sh && code ~/dev/TemplateRepoCxx"

# 进入 wsl
.\Arch.exe run bash -c "neofetch"
.\Arch.exe
