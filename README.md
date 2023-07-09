# lazywsl

核弹式安装 wsl + C++ + vscode 开发环境。你挺赖皮嘛

### 安装方法

0. 确保 “适用于 Linux 的 Windows 子系统” 已经启用。（可在 `OptionalFeatures.exe` 中启用）
1. 下载本项目到有**写权限**的目录，例如 `%UserProfile%`
2. 在**本项目文件夹**下运行 powershell 终端，执行 `.\main.ps1`
3. 按照提示，设定 Linux 的用户名和密码（请勿使用不常见的字符）
4. 大约几秒钟后，提示按下 enter，按下回车。
5. 大约一分钟后，成功进入 Linux 终端，请输入 `exit` 并回车
6. 等待后续安装完成即可！

### 卸载方法

1. 在本项目文件夹下运行终端，执行 `.\Arch.exe clean` 即可。（wsl Arch 中的所有文件将被清除。）

### 网络出错？

1. pacman 安装出错：这个脚本尽量使用了国内的镜像，可能是镜像正在被维护，建议**卸载**后重试 `.\main.ps1`。
2. vscode 插件下载失败：无需卸载。在 wsl 中执行 `bash ~/dev/vscode_install.sh` 即可。
