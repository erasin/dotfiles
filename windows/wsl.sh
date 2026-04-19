
is_wsl() {
    [[ -n "$WSL_DISTRO_NAME" ]] || grep -qi microsoft /proc/version 2>/dev/null
}

# 设置 DISPLAY 用于 WSLg
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0

# 或者简单版本（WSLg 通常使用这个）
export DISPLAY=:0

# 如果使用 Wayland
export WAYLAND_DISPLAY=wayland-0


# wsl 中启用 ssh-agent
if ! pgrep -x ssh-agent > /dev/null; then
    eval "$(ssh-agent -s)"
fi

if ! ssh-add -l &>/dev/null; then
    [[ -f ~/.ssh/id_ed25519 ]] && ssh-add ~/.ssh/id_ed25519
    [[ -f ~/.ssh/id_rsa ]] && ssh-add ~/.ssh/id_rsa
fi

# 命令不可用
# if ! command -v cmd.exe &> /dev/null; then
#     # sudo sh -c 'echo :WSLInterop:M::MZ::/init:PF > /usr/lib/binfmt.d/WSLInterop.conf'
#     sudo systemctl unmask systemd-binfmt.service
#     sudo systemctl restart systemd-binfmt
#     sudo systemctl mask systemd-binfmt.service
# fi
