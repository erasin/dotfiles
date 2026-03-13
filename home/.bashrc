# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# wsl 中启用 ssh-agent
if [[ -n $WSL_DISTRO_NAME ]]; then
    [[ -f ~/dotfiles/windows/wsl.sh ]] && source ~/dotfiles/windows/wsl.sh   
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
