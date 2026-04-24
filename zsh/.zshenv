# ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [ ! -f "$SSH_AUTH_SOCK" ]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

# ==== 通用配置 ====
export TERM_THEME=dark
export TERM=xterm-256color
export EDITOR=hx
export SYSTEM_EDITOR=hx
export LANG=zh_CN.UTF-8

# ==== 平台检测 ====
IS_LINUX=$([[ $(uname) == "Linux" ]] && echo 1 || echo 0)
IS_DARWIN=$([[ $(uname) == "Darwin" ]] && echo 1 || echo 0)

# ==== 本机路径 (通用) ====
LOCAL_BIN=$HOME/.local/bin

# ==== Rust ====
CARGO_PATH=${HOME}/.cargo/bin
export RUSTUP_DIST_SERVER=https://rsproxy.cn
export RUSTUP_UPDATE_SERVER=https://rsproxy.cn/rustup

# ==== Go ====
export GO111MODULE=on
export GOPROXY=https://goproxy.cn,direct
export GOSUMDB=sum.golang.org
export GOPATH=${HOME}/.golang
GOPATH_BIN=${HOME}/.golang/bin
export GOROOT=/usr/lib/go

# ==== JavaScript ====
NPM_PREFIX="${HOME}/.local/share/pnpm"
export PNPM_HOME=${HOME}/.local/share/pnpm
export BUN_INSTALL="${HOME}/.bun"
BUN_BIN=${HOME}/.bun/bin

# ==== Java ====
if [[ $(uname) == "Linux" ]]; then
    export JAVA_HOME=/usr/lib/jvm/default
fi
if [[ $(uname) == "Darwin" ]]; then
    export JAVA_HOME="/usr/local/opt/openjdk/libexec/openjdk.jdk/Contents/Home"
fi

# ==== Dart/Flutter ====
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

# ==== HarmonyOS ====
export HARMONY_TOOL_DIR=${HOME}/Development/harmonyos-next/command-line-tools
export HARMONY_CLI_PATH=${HARMONY_TOOL_DIR}/bin
export OHOS_NDK_HOME=${HARMONY_TOOL_DIR}/sdk/default/openharmony
export HDC_HOME=${OHOS_NDK_HOME}/toolchains
export CANGJIE_HOME=/opt/cangjie
CANGJIE_BIN_PATH=${CANGJIE_HOME}/bin
CANGJIE_TOOL_BIN_PATH=${CANGJIE_HOME}/tools/bin
CANGJIE_USER_PATH=${HOME}/.cjpm/bin

# ==== 其他工具 ====
RUBY_PATH=${HOME}/.local/share/gem/ruby/3.0.0/bin
LLDB_VSCODE_PATH=${HOME}/.vscode/extensions/lanza.lldb-vscode-0.2.3/bin/darwin/bin
HARMONY_GN_PATH=${HOME}/Development/harmonyos-next/depot_tools

# ==== Linux 特定 ====
if [[ $(uname) == "Linux" ]]; then
    LOCAL_BIN=$HOME/.local/bin

    # Android
    export ANDROID_HOME=${HOME}/.local/share/Android/SDK
    export ANDROID_NDK=${ANDROID_HOME}/ndk/26.2.11394342

    # Tools
    export PLAYDATE_SDK_PATH=/opt/playdate-sdk
    export CHROME_EXECUTABLE=/opt/google/chrome/chrome
    export HELIX_RUNTIME=${HOME}/Development/helix/runtime

    # ROCm
    ROCm_PATH=/opt/rocm/bin
    export OLLAMA_GPU_OVERHEAD=1000
    export OLLAMA_API_BASE_URL=http://127.0.0.1:11434
    export HSA_OVERRIDE_GFX_VERSION=10.30
    export HIP_VISIBLE_DEVICES=0

    # Other
    export GRAVEYARD=$HOME/.local/share/Trash
fi

# ==== Darwin 特定 ====
if [[ $(uname) == "Darwin" ]]; then
    LOCAL_BIN=$HOME/.local/bin:/usr/local/sbin
    export HOMEBREW_NO_AUTO_UPDATE=1
    export HOMEBREW_GITHUB_API_TOKEN=$(cat $HOME/dotfiles/tokens/brew 2>/dev/null)
    export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
    export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"

    export ANDROID_HOME=${HOME}/Library/Android/sdk
    export NDK_HOME=${ANDROID_HOME}/ndk/25.1.8937393

    export PNPM_HOME="/Users/erasin/Library/pnpm"
    export BUN_INSTALL="${HOME}/.bun"

    export HELIX_RUNTIME=/Applications/helix/runtime

    export PLANTUML_JAR=$HOME/Development/Tools/plantuml.jar
    export GRAPHVIZ_DOT=/usr/local/bin/dot

    export GRAVEYARD=$HOME/.Trash

    export LLVM_PATH='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin'
    export DYLD_LIBRARY_PATH='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/'
    export GODOT4_BIN="/Applications/Godot.app/Contents/MacOS/Godot"
fi

# ==== Wayland ====
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export MOZ_ENABLE_WAYLAND=1
fi

# ==== PATH 构建 (重要: $PATH 放开头) ====
export PATH=$PATH:$CARGO_PATH:$LOCAL_BIN:$GOPATH_BIN:$BUN_BIN:$NPM_PREFIX:$PNPM_HOME:$RUBY_PATH:$CANGJIE_BIN_PATH:$CANGJIE_TOOL_BIN_PATH:$CANGJIE_USER_PATH:$HDC_HOME:$HARMONY_CLI_PATH:$LLDB_VSCODE_PATH:$HARMONY_GN_PATH

if [[ $(uname) == "Linux" ]]; then
    export PATH=$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$ROCm_PATH
fi
if [[ $(uname) == "Darwin" ]]; then
    export PATH=$PATH:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools:${ANDROID_HOME}/emulator
fi

# ==== FPATH ====
export FPATH=$FPATH:${HOME}/.config/zsh/functions

# ==== API Keys / Tokens ====
if [[ -f ${HOME}/dotfiles/tokens/gemini ]]; then
    export GEMINI_API_KEY=$(cat ${HOME}/dotfiles/tokens/gemini)
fi

if [[ -f ${HOME}/dotfiles/tokens/minimax ]]; then
    export MINIMAX_API_KEY=$(cat ${HOME}/dotfiles/tokens/minimax)
    export OPENAI_BASE_URL=https://api.minimaxi.com/v1
    export OPENAI_API_KEY=${MINIMAX_API_KEY}
    export ANTHROPIC_BASE_URL=https://api.minimaxi.com/anthropic
    export ANTHROPIC_API_KEY=${MINIMAX_API_KEY}
fi

if [[ -f ${HOME}/dotfiles/tokens/huggingface ]]; then
    export HUGGINGFACE_TOKEN=$(cat $HOME/dotfiles/tokens/huggingface)
fi

export HF_ENDPOINT=https://hf-mirror.com

# ==== 其他配置 ====
export STEEL_HOME=${HOME}/.steel
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export GLICOL_CLI_SAMPLES_PATH=${HOME}/Development/github/glicol/js/assets
