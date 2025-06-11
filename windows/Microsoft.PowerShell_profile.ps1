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
function ll { eza --long --header --git --icons --time-style=long-iso $args }
function llt { eza --tree --long --header --git --icons --time-style=long-iso $args }

function gits { git status }
function gita { git add $args}
function gitb { git checkout $args}
function gitc { git commit $args}
function gitd { git diff $args}
function gitf { git fetch $args}
function gitm { git merge $args}
function gitt { git tag $args}
function gitr { git rebase $args}
function gitp { git pull $args}
function gitu { git push $args}
function gitl { git log --graph --pretty=oneline --abbrev-commit $args}
