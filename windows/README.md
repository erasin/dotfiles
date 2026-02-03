# windows

安装 PowerShell

```powershell
winget install PowerShell
```

`hx $PROFILE` 编辑配置，参考 `Microsoft.PowerShell_profile.ps1` 文件。

**使用管理员权限**执行 PowerShell

 Windows PowerShell 的执行策略限制导致的。有几种解决方法：

## 方法 1：临时绕过（推荐，仅本次运行）

```/dev/null/cmd.txt#L1
powershell -ExecutionPolicy Bypass -File .\helix\scripts\scooter-picker.ps1

# OR 临时会话
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

## 方法 2：修改当前用户的执行策略

以管理员身份打开 PowerShell，运行：

```/dev/null/cmd.txt#L1-2
# 允许运行本地脚本，远程脚本需要签名
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

或者更宽松的策略：

```/dev/null/cmd.txt#L1-2
# 允许运行所有脚本（不推荐用于生产环境）
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser
```

## 方法 3：仅对当前 PowerShell 会话生效

```/dev/null/cmd.txt#L1
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process
```

然后再运行你的脚本。

## 方法 4：解除单个文件的锁定

如果脚本是从网上下载的，Windows 会标记它为"来自互联网"。可以右键点击文件 → 属性 → 勾选"解除锁定" → 确定。

或者用 PowerShell 命令：

```/dev/null/cmd.txt#L1
Unblock-File -Path .\helix\scripts\scooter-picker.ps1
```

---

**推荐方案：** 如果只是临时运行一次，用**方法 1**；如果经常需要运行本地脚本，用**方法 2** 设置 `RemoteSigned` 策略。

```powershell

New-Item -ItemType SymbolicLink -Path "~/intelephense/licence.txt" -Target "D:\erasin\dotfiles\tokens\intelephenser"

# 创建链接
New-Item -ItemType SymbolicLink -Path "~/.config/wezterm" -Target "D:\erasin\dotfiles\wezterm"
New-Item -ItemType SymbolicLink -Path "~/AppData/Roaming/alacritty" -Target "D:\erasin\dotfiles\alacritty"
New-Item -ItemType SymbolicLink -Path "~/AppData/Roaming/helix" -Target "D:\erasin\dotfiles\helix"
New-Item -ItemType SymbolicLink -Path "~/AppData/Roaming/Zed" -Target "D:\erasin\dotfiles\Zed"
```

```powershell
# 自动转换 LF CRLF
git config --global core.autocrlf ture 
git config --global core.excudesfile ~/.gitignore_global
git config --global gui.encoding utf-8
```

**使用CLI**

    安装软件后需要从配置环境变量。

```powershell
# 环境
winget install --id Microsoft.VCRedist.2015+.x64
winget install Microsoft.Git
winget install OpenJS.NodeJS
winget install 7Zip.7Zip

## 终端
winget install Microsoft.WindowsTerminal 

# 命令
winget install Starship.Starship
winget install eza-community.eza
winget install ajeetdsouza.zoxide
winget install sxyazi.yazi
winget install thomasschafer.scooter
winget install Schniz.fnm
winget install sharkdp.bat
winget install sharkdp.fd
winget install chmln.sd
winget install BurntSushi.ripgrep.MSVC
winget install hurl
winget install dundee.gdu
winget install lazygit
```

## MSVC

```powershell
winget install Microsoft.VisualStudio.2022.BuildTools --force  --override  "--wait --passive --add Microsoft.VisualStudio.Workload.VCTools --add Microsoft.VisualStudio.Component.VC.Tools.x86.x64 --add Microsoft.VisualStudio.Component.Windows11SDK.22000"
```

## window terminal

下面是 windows terminal 配置，需要注意的地方有

- font.face 字体需要支持 nerd font
- intenseTextStyle 设置高亮加粗，否则 helix 的一些加粗无法正确渲染
- rendering.graphicsAPI 选择 direct2d , 渲染 icon 宽字符使用

```json

{
  "profiles": {
    "defaults": {
      "adjustIndistinguishableColors": "never",
      "antialiasingMode": "cleartype",
      "colorScheme": "One Half Light",
      "font": {
        "axes": {},
        "builtinGlyphs": true,
        "face": " Cascadia Mono, Symbols Nerd Font Mono",
        "features": {}
      },
      "intenseTextStyle": "all", // 
      "opacity": 100,
      "padding": "0",
      "startingDirectory": "E:\\",
      "suppressApplicationTitle": false,
      "useAcrylic": false
    },
    "rendering.graphicsAPI": "direct2d",  // 字体渲染问题
    "schemes": [],
    "snapToGridOnResize": true,
    "theme": "light",
    "themes": []
  }
}
```
