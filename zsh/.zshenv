# ==== BY SELF ===
export TERM_THEME=dark

# ./.config/environment.d/envvars.conf
# GTK_IM_MODULE=fcitx
# QT_IM_MODULE=fcitx
# XMODIFIERS=@im=fcitx
# SDL_IM_MODULE=fcitx
# GLFW_IM_MODULE=fcitx

# === TERM ====
# export TERM=xterm-256color
export EDITOR=hx
export SYSTEM_EDITOR=hx

# LANG zh_CN, en_US
export LANG=zh_CN.UTF-8
export LANG_ALL=zh_CN.UTF-8



# 使用远程的时候，禁用 gnome-keyring 
# export SSH_AUTH_SOCK=


# ======= rust ========
CARGO_PATH=${HOME}/.cargo/bin
# export RUSTC_WRAPPER=sccache
# # 清华大学
# RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup

# # 中国科学技术大学
# RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
# RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup

# # 上海交通大学
# RUSTUP_DIST_SERVER=https://mirrors.sjtug.sjtu.edu.cn/rust-static/

## 字节
export RUSTUP_DIST_SERVER=https://rsproxy.cn
export RUSTUP_UPDATE_SERVER=https://rsproxy.cn/rustup

# ======= go ===========
export GOPROXY=https://goproxy.cn
# 使用私有库,  使用 , 分割,支持通配符 *
export GOPRIVATE=git.dyuit.cn
export GO111MODULE=on;
GOPATH_BIN=${HOME}/golang/bin
export GOPATH=${HOME}/golang
export GOROOT=/usr/lib/go

if [[ $(uname) == "Darwin" ]]; then
  export GOROOT="${HOME}/golang/go1.22"
fi

# ======= python =========
# if [[ $VIRTUAL_ENV ]]; then
#   python_path="${VIRTUAL_ENV}/bin/python"
# elif [[ $CONDA_PREFIX ]] ; then
#   python_path="${CONDA_PREFIX}/bin/python"
# else
#   python_path="python"
# fi
# export PYTHONPATH=python_path
# if [[ $(uname) == "Linux" ]]; then
#   . $HOME/.rye/env
# fi
# ======== javascript =============

# YARN_PATH="$(yarn global bin)"
if [[ $(uname) == "Linux" ]]; then
  export PNPM_HOME=${HOME}/.local/share/pnpm
fi

if [[ $(uname) == "Darwin" ]]; then
  export PNPM_HOME="/Users/erasin/Library/pnpm"
fi

# ======= java =========
# for android
if [[ $(uname) == "Linux" ]]; then
  export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
  # export JAVA_HOME=/opt/android-studio/jbr
fi
if [[ $(uname) == "Darwin" ]]; then
  export JAVA_HOME="/usr/local/opt/openjdk/libexec/openjdk.jdk/Contents/Home"
fi

# ==== dart flutter ============
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
# export FLUTTER_ROOT=/usr/lib/flutter

# ======= ruby ============
RUBY_PATH=${HOME}/.local/share/gem/ruby/3.0.0/bin 



# lldb debug bin
LLDB_VSCODE_PATH=${HOME}/.vscode/extensions/lanza.lldb-vscode-0.2.3/bin/darwin/bin

# ==== harmonyos dev eco =====
HARMONY_CLI_PATH=${HOME}/Development/harmonyos-next/command-line-tools/bin
HARMONY_GN_PATH=${HOME}/Development/harmonyos-next/depot_tools

export CANGJIE_HOME=/opt/cangjie
CANGJIE_BIN_PATH=${CANGJIE_HOME}/bin
CANGJIE_TOOL_BIN_PATH=${CANGJIE_HOME}/tools/bin
CANGJIE_USER_PATH=${HOME}/.cjpm/bin

## ======= PATH ============

LOCAL_PATH=$HOME/.local/bin

if [[ $(uname) == "Darwin" ]]; then
  LOCAL_PATH=$HOME/.local/bin:/usr/local/sbin
fi

export PATH=$CARGO_PATH:\
$PATH:\
$LOCAL_PATH:\
$GOPATH_BIN:\
$PNPM_HOME:\
$RUBY_PATH:\
$ROCm_PATH:\
$LLDB_VSCODE_PATH:\
$HARMONY_CLI_PATH:\
$CANGJIE_BIN_PATH:\
$CANGJIE_TOOL_BIN_PATH:\
$CANGJIE_USER_PATH:\
$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools

## ===== soft ======

# qwen
# export OPENAI_BASE_URL="https://dashscope-intl.aliyuncs.com/compatible-mode/v1"
# export OPENAI_API_KEY="your_api_key_here"
# export OPENAI_MODEL="qwen3-coder-plus"

# ZSH function dir: FPATH
export FPATH=$FPATH:${HOME}/.config/zsh/functions

# helix editor 
export HELIX_RUNTIME=${HOME}/Development/helix/runtime
export STEEL_HOME=${HOME}/.steel

# huggingface.co
export HF_ENDPOINT=https://hf-mirror.com
export HUGGINGFACE_TOKEN=$(cat $HOME/.config/tokens/huggingface.txt)

# bat man
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# man 2 select

# glicol samples
export GLICOL_CLI_SAMPLES_PATH=${HOME}/Development/github/glicol/js/assets

if [[ $(uname) == "Linux" ]]; then
  # android
  export ANDROID_HOME=${HOME}/.local/share/Android/SDK
  export ANDROID_NDK=${ANDROID_HOME}/ndk/26.2.11394342

  # Playdate
  export PLAYDATE_SDK_PATH=/opt/playdate-sdk

  # chrome
  export CHROME_EXECUTABLE=/opt/google/chrome/chrome

  # 默认使用 amdvlk for bevy
  # export AMD_VULKAN_ICD=RADV

  # AMD ROCM
  ROCm_PATH=/opt/rocm/bin
  export OLLAMA_GPU_OVERHEAD=1000

  # for ollama, pytorch AI框架
  HSA_OVERRIDE_GFX_VERSION=10.3.0

  # for rip rm-improved
  export GRAVEYARD=$HOME/.local/share/Trash
fi

if [[ $(uname) == "Darwin" ]]; then
  # 关闭 brew 自动更新
  export HOMEBREW_NO_AUTO_UPDATE=1 
  export HOMEBREW_GITHUB_API_TOKEN=$(cat $HOME/.config/tokens/huggingface.txt)

  # android
  export ANDROID_HOME=${HOME}/Library/Android/sdk
  ANDROID_PLATFORM_PATH=${ANDROID_HOME}/platform-tools
  ANDROID_TOOLS_PATH=${ANDROID_HOME}/tools
  ANDROID_EMULATOR_PATH=${ANDROID_HOME}/emulator
  export NDK_HOME=${ANDROID_HOME}/ndk/25.1.8937393

  export PLANTUML_JAR=$HOME/Development/Tools/plantuml.jar
  export GRAPHVIZ_DOT=/usr/local/bin/dot

  # for rip rm-improved
  export GRAVEYARD=$HOME/.Trash

  # FOR rust bindgen godot bind
  export LLVM_PATH='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin'
  export DYLD_LIBRARY_PATH='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/'
  export GODOT4_BIN="/Applications/Godot.app/Contents/MacOS/Godot"
fi
