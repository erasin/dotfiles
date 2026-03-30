# WSL

使用 opencode 安装 wsl 。

```
wsl   
```

## 安装

以管理员身份打开 PowerShell。

```powershell

## 确认是 wsl2
wsl --version 

## wsl2
wsl --set-default-version 2 

## 安装到 D 盘
wsl --install -d FedoraLinux-43 --web-download --install-location D:\WSL\Fedora43

```

## 环境

- /etc/os-release 获取系统信息

使用环境变量 `$WSL_DISTRO_NAME` 判定是否为 wsl

```bash
# 方法1：检查 /proc/version (最常用)
if grep -qi microsoft /proc/version 2>/dev/null; then
    echo "Running in WSL"
fi
# 方法2：检查 WSL_DISTRO_NAME 环境变量
if [[ -n "$WSL_DISTRO_NAME" ]]; then
    echo "Running in WSL: $WSL_DISTRO_NAME"
fi
# 方法3：检查 WSL_INTEROP
if [[ -n "$WSL_INTEROP" ]]; then
    echo "Running in WSL"
fi
# 方法4：综合检查函数
is_wsl() {
    [[ -n "$WSL_DISTRO_NAME" ]] || grep -qi microsoft /proc/version 2>/dev/null
}
# 使用示例
if is_wsl; then
    echo "WSL 环境"
else
    echo "原生 Linux"
fi
```

```bash
# 中文环境
sudo dnf install -y langpacks-zh_CN glibc-langpack-zh
```

## exe 无法执行

WSL2 修复 binfmt_misc 配置

Fedora 

```bash
## 先检查 PATH

# 查看系统已有的 binfmt 注册, 是否 enabled
cat /proc/sys/fs/binfmt_misc/WSLInterop

# 创建配置文件
sudo sh -c 'echo :WSLInterop:M::MZ::/init:PF > /usr/lib/binfmt.d/WSLInterop.conf'

# 确保服务没有被屏蔽
sudo systemctl unmask systemd-binfmt.service

# 启用并启动服务（这样重启后也会自动生效）
sudo systemctl enable systemd-binfmt.service
sudo systemctl restart systemd-binfmt.service

```

重启 `wsl --shutdown`

## remi

```bash
# 例如：启用 PHP 8.2 的仓库并安装
sudo dnf --enablerepo=remi,remi-php82 install php
```

## window wslconfig

{userHome}/.wslconfig

```ini
# 针对所有WSL 2发行版的全局设置
[wsl2]

# 设置内存上限为 4GB (可以根据你的电脑内存和需求调整，如 2GB, 8GB)
memory=20GB

# (可选) 设置CPU核心数，例如分配给WSL 4个逻辑处理器
# processors=4

# (可选) 设置交换文件大小，当物理内存不足时使用，例如 2GB
swap=12GB

# (可选) 实验性功能：让WSL逐渐将空闲内存归还给Windows，避免内存“只增不减”
[experimental]
autoMemoryReclaim=gradual
```
