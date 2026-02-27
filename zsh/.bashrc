# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

. $HOME/dotfiles/zsh/.zshenv
. $HOME/dotfiles/zsh/alias.sh

eval "$(zoxide init bash)"
eval "$(starship init bash)"
#eval "$(atuin init bash)"
