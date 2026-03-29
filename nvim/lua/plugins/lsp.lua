-- LSP 相关插件列表
-- 包含 Language Server Protocol 配置、Mason 包管理等

return {
    -- LSP 基础依赖
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
    },

    -- Mason LSP 包管理器
    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonInstallAll" },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
        },
    },

    -- LSP 设置辅助
    {
        "junnplus/nvim-lsp-setup",
        requires = {
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
    },

    -- Fidget LSP 状态
    {
        "j-hui/fidget.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {},
    },

    -- AsyncLSP 异步支持（暂未安装）
    -- {
    --     "RasulFSRV01/AsyncLSP",
    --     event = { "BufReadPost", "BufNewFile" },
    --     opts = {},
    -- },

    -- Trouble 诊断列表
    {
        "folke/trouble.nvim",
        cmd = { "TroubleToggle", "Trouble" },
        keys = {
            { "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Trouble" },
        },
        opts = {
            use_diagnostics = true,
            action_keys = {
                close = { "q", "<esc>" },
            },
        },
    },
}
