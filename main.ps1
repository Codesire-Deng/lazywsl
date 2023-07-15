$username = Read-Host "Linux username"
$password = Read-Host "Linux password" -MaskInput

# 在错误时停止
$ErrorActionPreference = "Stop"

# pacman 安装指令
$install = "pacman -S --noconfirm --disable-download-timeout"

# 初始化 wsl
.\Arch.exe install

# 初始化 sudoers 和 keyring
.\Arch.exe run bash ./config/keyring_install.sh

echo "devtools:"

# 安装 devtools
.\Arch.exe run bash ./config/toolset_install.sh

echo "useradd:"

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
