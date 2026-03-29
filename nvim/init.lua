-- Neovim 配置文件入口
-- 引导 Lazy.nvim 并加载各项配置

-- 延迟加载 lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- 加载插件列表
require("lazy").setup("plugins", {
    defaults = { lazy = false },
    install = { missing = true },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "tarPlugin",
                "netrwPlugin",
                "zipPlugin",
            },
        },
    },
})

-- 禁用 netrw 插件
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- 加载核心配置
require("config.options")      -- Neovim 选项配置
require("config.keymaps")      -- 快捷键映射
require("config.autocmds")     -- 自动命令

-- 加载插件配置
require("plugin-config.treesitter")  -- Treesitter 配置
require("plugin-config.lsp")           -- LSP 配置
