
# ime
if [[ $(uname) == "Linux" ]]; then
  # if [[ "$XDG_SESSION_TYPE" != "wayland" ]]; then
  #   export GTK_IM_MODULE=fcitx
  # fi

  # .config/environment.d
fi

if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
  # https://wiki.archlinux.org/title/Wayland

  # firefox
  export MOZ_ENABLE_WAYLAND=1

  # electron version > 28  
  # old version use ~/.config/electron-flags.conf
  # export ELECTRON_OZONE_PLATFORM_HINT=wayland

  # qt
  # export QT_QPA_PLATFORM="wayland;xcb"

  # export CLUTTER_BACKEND=wayland

  # # sdl x11 / wayland
  # export SDL_VIDEODRIVER="wayland,x11"

  # # glfw
  # export XDG_SESSION_TYPE=wayland

  # AMD GPU
  export HSA_OVERRIDE_GFX_VERSION=10.3.0
  # export HCC_AMDGPU_TARGET="gfx1030"
  # export PYTORCH_CUDA_ALLOC_CONF='garbage_collection_threshold:0.6,max_split_size_mb:512'
else
  # winit < 0.29.2
  # export WINIT_UNIX_BACKEND=x11
  # winit >= 0.29.2
  # unset WAYLAND_DISPLAY
fi
