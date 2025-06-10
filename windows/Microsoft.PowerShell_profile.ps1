# 设置 UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8
[Console]::InputEncoding = [System.Text.Encoding]::UTF8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Invoke-Expression (&starship init powershell)
starship init powershell | Invoke-Expression
zoxide init powershell | Out-String | Invoke-Expression
fnm env --use-on-cd --shell powershell | Out-String | Invoke-Expression

# alias
Set-Alias ls eza -Force -Option AllScope
function ll { eza -l --time-style=long-iso $args }
function rm { del $args }
