# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

is_wsl() {
    [[ -n "$WSL_DISTRO_NAME" ]] || grep -qi microsoft /proc/version 2>/dev/null
}

# wsl 中启用 ssh-agent
if is_wsl; then
    [[ -f $HOME/dotfiles/windows/wsl.sh ]] && . $HOME/dotfiles/windows/wsl.sh
fi


# https://github.com/akinomyoga/ble.sh
if [ -f ~/.local/share/blesh/ble.sh ]; then
    source -- ~/.local/share/blesh/ble.sh
fi

. $HOME/dotfiles/zsh/.zshenv
. $HOME/dotfiles/zsh/alias.sh

eval "$(zoxide init bash)"
eval "$(starship init bash)"
eval "$(atuin init bash)"
