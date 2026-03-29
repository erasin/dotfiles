-- UI 相关插件列表
-- 包含主题、状态栏、弹出窗口等 UI 美化插件

return {
    -- Lualine 状态栏
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = {
            options = {
                theme = "auto",
                component_separators = "|",
                section_separators = "",
                globalstatus = true,
            },
        },
    },

    -- One Dark Pro 主题
    {
        "olimorris/onedarkpro.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd("colorscheme onedark")
        end,
    },

    -- TokyoNight 主题
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },

    -- Catppuccin 主题
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        opts = {
            integrations = {
                treesitter = true,
                native_lsp = true,
                lsp_saga = true,
                cmp = true,
                which_key = true,
                dashboard = true,
                alpha = true,
            },
        },
    },

    -- Night Owl 主题（暂未安装）
    -- {
    --     "oxfistem/night-owl.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     opts = {},
    -- },

    -- Kanagawa 主题
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },

    -- Everforest 主题
    {
        "neanias/everforest-nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("everforest").setup()
        end,
    },

    -- Sonokai 主题
    {
        "sainnhe/sonokai",
        lazy = false,
        priority = 1000,
        opts = "sonokai",
    },

    -- Gruvbox Material 主题
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        priority = 1000,
        opts = "gruvbox-material",
    },

    -- Noice 通知和命令栏
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {},
    },

    -- Edgy 侧边栏窗口
    {
        "folke/edgy.nvim",
        event = "VeryLazy",
        opts = {},
    },

    -- Paint 自定义高亮
    {
        "folke/paint.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {},
    },

    -- Spell Suggester 拼写建议（暂未安装）
    -- {
    --     "folke/spell-suggester.nvim",
    --     event = { "BufReadPost", "BufNewFile" },
    --     opts = {},
    -- },
}
