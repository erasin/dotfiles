# WSL

使用 opencode 安装 wsl 。


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
