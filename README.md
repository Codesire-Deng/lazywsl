# lazywsl

核弹式安装 wsl + C++ + vscode 开发环境。你挺赖皮嘛

### 安装方法

0. 确保 “适用于 Linux 的 Windows 子系统” 已经启用。（可在 `OptionalFeatures.exe` 中启用）
1. 下载本项目到有**写权限**的目录，例如 `%UserProfile%`
2. 下载 [yuk7/ArchWSL](https://github.com/yuk7/ArchWSL/releases) 项目的 [Arch.zip](https://github.com/yuk7/ArchWSL/releases/download/22.10.16.0/Arch.zip) 并解压，使`Arch.exe`、`rootfs.tar.gz`与本项目的`main.ps1`处于同一目录下。
3. 在**本项目文件夹**下运行 powershell 终端，执行 `.\main.ps1`
4. 按照提示，设定 Linux 的用户名和密码（请勿使用不常见的字符）
5. 等待后续安装完成即可！

### 全自动配置 vscode

如果 Windows 已安装 vscode，且在终端中能找到 `code` 命令（即 code.exe 已位于 Path 中），则脚本将全自动配置 vscode。

所有配置只应用于 wsl 内部，不会对 Windows vscode 本身的配置造成影响。

### 卸载方法

1. 在本项目文件夹下运行终端，执行 `.\Arch.exe clean -y` 即可。（wsl Arch 中的所有文件将被清除。）

### 出错？

1. pacman 网络出错：这个脚本尽量使用了国内的镜像，可能是镜像正在被维护，建议**卸载**后重试 `.\main.ps1`。
2. vscode 插件下载失败：无需卸载。在 wsl 中执行 `bash ~/dev/vscode_install.sh` 即可。
3. pacman 密钥初始化出错（表现为 pacman 下载软件包成功，但安装失败）：此错误和时钟有关，建议**卸载**后重试 `.\main.ps1`。
