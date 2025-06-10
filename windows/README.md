# windows

window poershell

`hx $PROFILE` 编辑配置

**使用CLI**

```
winget install Microsoft.WindowsTerminal 
winget install Starship.Starship
winget install eza-community.eza
winget install ajeetdsouza.zoxide
winget install sxyazi.yazi
winget install thomasschafer.scooter
winget install Schniz.fnm
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
