# zsh

zsh 的加载 `$ZDOTDIR` 目录下的一系列文件, `$ZDOTDIR` 未设定的时候使用 `$HOME` 用户主目录。

加载的配置文件顺序为 `.zshenv -> .zprofile -> .zshrc -> .zlogin -> .zlogout-`

- .zshenv     # 环境变量配置
- .zprofile    
- .zshrc 
- .zlogin 
- .zlogout


## 使用 ZDOTDIR

因为文件总装在 `~/.config/zsh` 目录下, 需要设定 `ZDOTDIR` 来加载配置文件，同时 `.zshenv` 仅加载一次，所以同步引入 自定义的 env 文件。

创建 `~/.zshenv`

```bash
ZDOTDIR=${HOME}/.config/zsh
. $ZDOTDIR/.zshenv
```
