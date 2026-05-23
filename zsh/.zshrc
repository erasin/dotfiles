. $ZDOTDIR/alias.sh

# zsh plugin
if [[ $(uname) == "Linux" ]]; then

  if [[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
  elif [[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  fi

  if [[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
  elif [[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  fi

  if [[ -f /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
  fi

  autoload -Uz compinit && compinit
fi

if [[ $(uname) == "Darwin" ]]; then

  # if type brew &>/dev/null; then
  #   FPATH=$HOME/.config/zsh-completions:$(brew --prefix)/share/zsh-completions:$FPATH
  #   autoload -Uz compinit && compinit
  # fi
  
  if [[ -f /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  fi

  if [[ -f /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh ]]; then
    source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
  fi

  if [[ -f /usr/local/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ]]; then
    source /usr/local/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
  fi
fi

# cursor bug
[[ "$TERM_PROGRAM" == "vscode" ]] && unset ARGV0

if [[ "$ARGV0" == "/usr/bin/cursor" ]]; then
  unset ARGV0
fi

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
eval "$(atuin init zsh)"
eval "$(wt config shell init zsh)"
# eval "$(direnv hook zsh)"
# eval "$(fnm env --use-on-cd --shell zsh)"

# echo -e "\e]2;New Title\007";sleep 100
# preexec() { print -Pn "\e]0;${PWD##*/} \a" }
# 显示最后命令 
preexec() { print -Pn "\e]0;$1 - zsh\a" }  

if [[ $(uname) == "Linux" ]]; then
  if [[ -f ${HOME}/.config/broot/launcher/bash/br ]]; then
    source ${HOME}/.config/broot/launcher/bash/br
  fi
  # source /usr/share/nvm/init-nvm.sh
fi

