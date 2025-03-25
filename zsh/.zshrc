. $ZDOTDIR/alias.sh

# export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
# source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# if type brew &>/dev/null; then
#   FPATH=$HOME/.config/zsh-completions:$(brew --prefix)/share/zsh-completions:$FPATH
#   autoload -Uz compinit && compinit
# fi

# source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
# source /usr/local/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# plugins=(
#   zsh-autosuggestions
#   zsh-completions
#   zsh-history-substring-search
#   zsh-syntax-highlighting
# )


# zsh plugin
if [[ $(uname) == "Linux" ]]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
  source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

  autoload -Uz compinit && compinit

  # . $HOME/.rye/env
fi

if [[ $(uname) == "Darwin" ]]; then
  source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

  if type brew &>/dev/null; then
    FPATH=$HOME/.config/zsh-completions:$(brew --prefix)/share/zsh-completions:$FPATH
    autoload -Uz compinit && compinit
  fi

  source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
  source /usr/local/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
fi

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
eval "$(atuin init zsh)"
# eval "$(direnv hook zsh)"
eval "$(fnm env --use-on-cd --shell zsh)"

# echo -e "\e]2;New Title\007";sleep 100
# preexec() { print -Pn "\e]0;${PWD##*/} \a" }
# 显示最后命令 
preexec() { print -Pn "\e]0;$1 - zsh\a" }  

if [[ $(uname) == "Linux" ]]; then
  source ${HOME}/.config/broot/launcher/bash/br
  # source /usr/share/nvm/init-nvm.sh
fi

HF_ENDPOINT=https://hf-mirror.com
