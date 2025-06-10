# npm config set registry  https://registry.npm.taobao.org

alias ls='eza --icons=auto'
# alias whereis=whereis-rs
# alias vim=nvim
# #alias rm=rip
alias neovide='${HOME}/Applications/Neovide.app/Contents/MacOS/neovide'
alias py=python

alias cp='cp -iv'
alias mv='mv -iv'
# alias rm='rm -i'
alias rm='rm -i'
alias ln='ln -iv'
alias ll='eza --all --header --group --long --git --time-style long-iso --icons=auto'
alias lltree='eza --tree --level=2 --all --long --git --icons=auto'
alias vimdiff='nvim -d'
alias copy='rsync -r -v --progress'
alias bevyrundy='cargo run --features bevy/dynamic'

## 环境 {{{
# alias gocn='export LANG=zh_CN.UTF-8;export LANGUAGE=zh_CN:zh:en;echo "zh_CN.UTF-8";'
alias goen='export LANGUAGE=en_US;echo "LANGUAGE=en_US";'
alias goen2='export LANG=en_US.UTF-8;export LANGUAGE=en_US:en;echo "en_US.UTF-8";'
#}}}

# alias ze='zellij  -l simple'
# alias ze='zellij -s O -l simple attach --index 0 --create'
function ze(){
    ZJ_SESSIONS=$(zellij list-sessions)
    NO_SESSIONS=$(echo "${ZJ_SESSIONS}" | wc -l)
    
    if [ "${NO_SESSIONS}" -ge 2 ]; then
        zellij -l simple attach \
        "$(echo "${ZJ_SESSIONS}" | sk)"
    else
        zellij -l simple  attach -c Z
    fi
}

function hxa() {
    # env -u WAYLAND_DISPLAY
    nohup  alacritty -T ${PWD##*/} --config-file ${HOME}/.config/alacritty/hx.toml --working-directory $(pwd) -e hx -w $(pwd) $@ > /dev/null >&1 &
    # nohup kitty --title $(pwd) --working-directory $(pwd) hx -w $(pwd) $@ > /dev/null >&1 &
    # nohup wezterm start --cwd $(pwd) -- hx $@ > /dev/null >&1 &
}

function ala() {
    nohup alacritty -T ${PWD##*/} --config-file ${HOME}/.config/alacritty/hx.toml --working-directory $(pwd) $@ > /dev/null >&1 &
}


# alias cnpm="npm --registry=https://registry.npm.taobao.org \
# --cache=$HOME/.npm/.cache/cnpm \
# --disturl=https://npm.taobao.org/dist \
# --userconfig=$HOME/.cnpmrc"

## tools {{{

# alias yui='java -Djava.awt.headless=true -jar ${HOME}/Development/Tools/bin/yuicompressor-2.4.8.jar'
# alias umlp='java -Djava.awt.headless=true -jar ${PLANTUML_JAR}'
# alias umlsvg='java -Djava.awt.headless=true -jar ${PLANTUML_JAR} -tsvg '
# alias umlsvgWatcher='java -jar ${PLANTUML_JAR}-charset utf-8 -tsvg -gui'
# alias umlpng='java -Djava.awt.headless=true -jar ${PLANTUML_JAR} -charset utf-8 -tpng '
# alias umlpngWatcher='java -jar ${PLANTUML_JAR} -charset utf-8 -tpng -gui'
# alias pumlant=umlpng
alias umlpng='plantuml -charset utf-8 -tpng '
alias umlpngWatcher='plantuml -charset utf-8 -tpng -gui'

alias wgetm3u='${HOME}/Development/Tools/wgetm3u.sh'
alias ape2mp3='${HOME}/Development/Tools/ape2mp3.sh'

function wav2mp3() {
    ffmpeg -i ${1} -b:a 320k -vn ${2}.mp3
}

function mkv2mp4(){
    for f in *.mkv; do ffmpeg -i "$f" -c copy "${f%.mkv}.mp4"; done
}

function mkv2mp3() {
    ffmpeg -i "$1" -vn -c:a libmp3lame -y "$1.mp3"
}

function mp42mp3() {
    ffmpeg -i "$1" -b:a 192K -vn "$1".mp3
}

function mp3split() {
    # $3 $4 hh:mm:ss
    ffmpeg -i "$1" -ss $3 -t $4 -acodec copy "$2"
}

function nohupbg(){
    nohup $1 > /dev/null 2>&1 &
}

alias mpvv='mpv $(wl-paste) --sub-auto=fuzzy --ytdl-raw-options=ignore-config=,sub-lang=en,write-auto-sub='

alias https='http --default-scheme=https'

alias colorChoose='osascript -e "tell application \"Visual\ Studio\ Code\" \n choose color \n end tell"'
#}}}

# 进程
alias psg="ps auxw | rg "
alias psptree="ps auxwwwf"
alias openports='netstat -nape --inet'
alias netport='netstat -ntlp'              # opening ports 端口

alias iconvgu='iconv -f gbk -t utf8 '
alias datetime="date +'%Y-%m-%dT%H:%M:%SZ'"
alias touchmd="touch `date +'%Y%m%d-%H%M.md'`"
alias stnote="hx `date +'%Y%m%d-%H%M.md'`"
alias bynote="touch `date +'%Y%m%d-%H%M.md'`;hx `date +'%Y%m%d-%H%M.md'`"
alias wgetweb="wget -r -np -nd -k -p"   #下载网站某目录

# git{{{
alias gits='git'
alias gita='git add'
alias gitb='git checkout'
alias gitc='git commit'
alias gitd='git diff'
alias gitf='git fetch'
alias gitt='git tag'
alias gitr='git rebase'
alias gitp='git pull'
alias gitu='git push'
alias gitl='git log --graph --pretty=oneline --abbrev-commit'
# }}}

alias gopathset='export GOPATH=`pwd`'
alias gobuildsmall='go build -ldflags "-s -w"'

# alias proxy_local_http='export http_proxy=socks5://127.0.0.1:7891;export https_proxy=socks5://127.0.0.1:7891;'
# alias proxy_local_sock='export http_proxy=socks5://127.0.0.1:7891;export https_proxy=socks5://127.0.0.1:7891;'
# alias proxy_local_sock='export http_proxy=socks5://127.0.0.1:55773;export https_proxy=socks5://127.0.0.1:55773;'
alias proxy-set='export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890'
alias proxy_local_unset='unset http_proxy ; unset https_proxy;'

alias rust_doc='rustup doc --std'
alias rust_stable='rustup default stable'
alias rust_night='rustup default nightly'

alias pane50='tmux resize-pane -x 50'


alias killnds='sudo killall -HUP mDNSResponder'

# [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

function j() {
    OUTPUT=`jump $@`
    if [ $? -eq 0 ]
    then cd "$OUTPUT"
    else echo "$OUTPUT"
    fi
}

alias skcode='code $(sk)'
alias skcd='cd "$(sk)"'
# for wayland
alias code="code --ozone-platform=wayland"


function theme-dark() {
    #env
    sd "^export TERM_THEME=light" "export TERM_THEME=dark" ${HOME}/.config/zsh/.zshenv
    
    
    # alacritty
    sd "themes/oneLight.toml"  "themes/oneDark.toml" ${HOME}/.config/alacritty/alacritty.toml
    sd "themes/oneLight.toml"  "themes/oneDark.toml" ${HOME}/.config/alacritty/hx.toml
    
    # wezterm
    sd "M.color_scheme = \"OneHalfLight\"" "M.color_scheme = \"OneHalfDark\"" ${HOME}/.config/wezterm/wezterm.lua
    
    # helix
    sd "^theme = \"onelight_local\""  "theme = \"onedark_local\"" ${HOME}/.config/helix/config.toml
    
    # zellij
    # sd "^theme = \"onelight\""  "theme = \"onedark\"" ${HOME}/.config/zellij/config.kdl
    
    # gitconfig/delta
    sd "light = true" "dark = true"  ${HOME}/.gitconfig
    
    # bat
    sd "OneHalfLight" "OneHalfDark" ${HOME}/.config/bat/config

    # aichat
    sd "light_theme: true" "light_theme: false" ${HOME}/.config/aichat/config.yaml

    # kitty
    if command -v kitten &> /dev/null; then
        if [ "${KITTY_WINDOW_ID}" ]; then
            kitten theme "One Half Dark"
        fi
        sd "^text_composition_strategy"  "# text_composition_strategy" ${HOME}/.config/kitty/kitty.conf
    fi
    
    export TERM_THEME="dark"
}

function theme-light() {
    #env
    sd "^export TERM_THEME=dark" "export TERM_THEME=light" ${HOME}/.config/zsh/.zshenv
    
    # alacritty
    sd "themes/oneDark.toml"  "themes/oneLight.toml" ${HOME}/.config/alacritty/alacritty.toml
    sd "themes/oneDark.toml"  "themes/oneLight.toml" ${HOME}/.config/alacritty/hx.toml
    
    # wezterm
    sd "M.color_scheme = \"OneHalfDark\"" "M.color_scheme = \"OneHalfLight\"" ${HOME}/.config/wezterm/wezterm.lua
    
    # helix
    sd "^theme = \"onedark_local\""  "theme = \"onelight_local\"" ${HOME}/.config/helix/config.toml
    
    # zellij
    # sd "^theme = \"onedark\""  "theme = \"onelight\"" ${HOME}/.config/zellij/config.kdl
    
    # gitconfig/delta
    sd "dark = true" "light = true"  ${HOME}/.gitconfig
    
    # bat
    sd "OneHalfDark" "OneHalfLight" ${HOME}/.config/bat/config
    
    # aichat
    sd "light_theme: false" "light_theme: true" ${HOME}/.config/aichat/config.yaml

    # kitty
    if command -v kitten &> /dev/null; then
        if [ "${KITTY_WINDOW_ID}" ]; then
            kitten theme "One Half Light"
        fi
        sd "# text_composition_strategy"  "text_composition_strategy" ${HOME}/.config/kitty/kitty.conf
    fi

    export TERM_THEME="light"
}

function theme-toggle() {
    # check
    if [[ $TERM_THEME == "" ]]
    then
        check=$(rg "light = true"  ~/.gitconfig|awk '{print $1}')
        if [[ $check == "" ]]
        then TERM_THEME="dark"
        else TERM_THEME="light"
        fi
    fi
    
    if [[ $TERM_THEME == "light" ]]
    then theme-dark
    else theme-light
    fi
}

alias tgtheme='theme-toggle'

# linux
if [[ $(uname) == "Linux" ]]; then
    alias open='xdg-open $1 &> /dev/null'
    alias spi='sonic-pi-tool'
    alias web='epiphany'
fi

# kitty
if [[ "$TERM" = "xterm-kitty" ]]; then
    alias ssh="kitty +kitten ssh"
    alias diff="kitty +kitten diff"
    alias icat="kitty +kitten icat"
    alias clip="kitty +kitten clipboard"
fi

if [[ $(uname) == "Darwin" ]]; then
    alias quicklook='qlmanage -p'
    alias setphp7='brew unlink php && brew link php@7.2 && brew services stop php && brew services start php@7.2'
    alias setphp8='brew unlink php@7.2 && brew link php && brew services stop php@7.2 && brew services start php'
    
    
    # OSX {{{
    
    alias ios-show='open -a Simulator'
    
    # 弹出 / 收回光驱
    alias eject="eject -v "
    alias retract="eject -t -v "
    
    osxEject() {
        osascript -e 'tell application "Finder" to eject disk "'$1'"'
    }
    
    proxy_port() {
        export http_proxy=socks5://127.0.0.1:${1};export https_proxy=socks5://127.0.0.1:${1};
    }
    
    # 重置app 图标
    alias resetDock='defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock'
    # }}}
fi

if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
    alias openfolder='niri msg action spawn -- nautilus $(pwd)'
    alias niri-msg-fcitx='niri msg action spawn -- fcitx5 -r'
    alias niri-msg-pomodoro='niri msg action spawn -- uair --quiet'
    alias gnome-control-center='env XDG_CURRENT_DESKTOP=GNOME gnome-control-center'
fi
