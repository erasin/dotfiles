# Cargo 

在使用 rsproxy 的时候，search 会出现提示 `crates-io` 问题，这里添加默认处理。

```toml 
[registry]
default = "crates-io"

# https://rsproxy.cn/
[source.crates-io]
replace-with = 'rsproxy-sparse'
[source.rsproxy]
registry = "https://rsproxy.cn/crates.io-index"
[source.rsproxy-sparse]
registry = "sparse+https://rsproxy.cn/index/"
[registries.rsproxy]
index = "https://rsproxy.cn/crates.io-index"
[net]
git-fetch-with-cli = true
```
