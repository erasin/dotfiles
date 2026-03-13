if [[ -z $WSL_DISTRO_NAME ]]; then
    exit 0
fi

# wsl 中启用 ssh-agent
if [[ -z "$SSH_AUTH_SOCK" ]]; then
    eval "$(ssh-agent -s)"
    [[ -f ~/.ssh/id_ed25519 ]] && ssh-add ~/.ssh/id_ed25519
    [[ -f ~/.ssh/id_rsa ]] && ssh-add ~/.ssh/id_rsa
fi

# 命令不可用
if ! command -v cmd.exe &> /dev/null; then
    # sudo sh -c 'echo :WSLInterop:M::MZ::/init:PF > /usr/lib/binfmt.d/WSLInterop.conf'
    sudo systemctl unmask systemd-binfmt.service
    sudo systemctl restart systemd-binfmt
    sudo systemctl mask systemd-binfmt.service
fi
