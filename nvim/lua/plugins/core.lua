-- 核心插件列表
-- 包含 Treesitter、Telescope、NvimTree 等核心编辑功能插件

return {
    -- Treesitter 语法高亮和文本对象
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        cmd = {
            "TSInstall",
            "TSInstallInfo",
            "TSInstallSync",
            "TSUpdate",
            "TSUpdateSync",
            "TSDisableAll",
            "TSEnableAll",
        },
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        event = { "BufReadPost", "BufNewFile" },
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = { "BufReadPost", "BufNewFile" },
    },
    {
        "RRethy/nvim-treesitter-textsubjects",
        event = { "BufReadPost", "BufNewFile" },
    },

    -- Telescope 文件搜索
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        keys = {
            { "<leader>f", "<cmd>Telescope<cr>", desc = "Telescope" },
        },
    },
    -- telescope-alpha-nvim-tabs（暂未安装）
    -- {
    --     "rachartier/telescope-alpha-nvim-tabs",
    --     event = { "BufReadPost", "BufNewFile" },
    -- },

    -- NvimTree 文件浏览器
    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
        keys = {
            { "<leader>n", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree" },
        },
        opts = {
            actions = {
                open_file = {
                    quit_on_open = false,
                },
            },
            update_focused_file = {
                enable = true,
                update_cwd = false,
            },
            filters = {
                custom = { "^\\.git$" },
            },
            view = {
                width = 30,
                side = "left",
                signcolumn = "no",
                number = false,
                relativenumber = false,
                cursorline = false,
            },
            renderer = {
                group_empty = true,
                indent_markers = {
                    enable = false,
                },
                icons = {
                    show = {
                        file = true,
                        folder = true,
                        folder_arrow = false,
                        git = true,
                    },
                },
            },
        },
    },

    -- 文本对象和移动
    {
        "echasnovski/mini.nvim",
        version = false,
        config = function()
            require("mini.pairs").setup()
            require("mini.move").setup()
            require("mini.bracketed").setup()
            require("mini.jump").setup()
            require("mini.jump2d").setup()
            require("mini.hipatterns").setup()
            require("mini.ai").setup({ custom_textobjects = {} })
            require("mini.notify").setup()
        end,
    },
    {
        "echasnovski/mini.pairs",
        version = false,
        event = "VeryLazy",
    },
    {
        "echasnovski/mini.move",
        version = false,
        event = "VeryLazy",
    },
    {
        "echasnovski/mini.bracketed",
        version = false,
        event = "VeryLazy",
    },
    {
        "echasnovski/mini.jump",
        version = false,
        event = "VeryLazy",
    },
    {
        "echasnovski/mini.jump2d",
        version = false,
        event = "VeryLazy",
    },
    {
        "echasnovski/mini.hipatterns",
        version = false,
        event = "VeryLazy",
    },

    -- Surround 文本环绕
    {
        "tpope/vim-surround",
        event = { "BufReadPost", "BufNewFile" },
    },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = { "BufReadPost", "BufNewFile" },
        opts = {},
    },

    -- Yanky 粘贴环
    {
        "gbprod/yanky.nvim",
        event = { "BufReadPost", "BufNewFile" },
        keys = {
            { "y", "<Plug>(YankyYank)", mode = { "n", "x" } },
            { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" } },
            { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" } },
            { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" } },
            { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" } },
            { "]p", "<Plug>(YankyPutIndentAfterLinewise)", mode = { "n" } },
            { "[p", "<Plug>(YankyPutIndentBeforeLinewise)", mode = { "n" } },
            { "]P", "<Plug>(YankyPutAfterLinewise)", mode = { "n" } },
            { "[P", "<Plug>(YankyPutBeforeLinewise)", mode = { "n" } },
        },
        opts = {},
    },

    -- Flash 快速跳转
    {
        "folke/flash.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {},
        keys = {
            {
                "s",
                mode = { "n", "x", "o" },
                function()
                    require("flash").jump()
                end,
                desc = "Flash 跳转",
            },
            {
                "S",
                mode = { "n", "x", "o" },
                function()
                    require("flash").jump()
                end,
                desc = "Flash 跳转",
            },
        },
    },

    -- GitLinker Git 链接
    {
        "ruifm/gitlinker.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            remote = "origin",
        },
        keys = {
            { "<leader>gy", "<cmd>lua require('gitlinker').get_buf_link()<cr>", desc = "GitLinker" },
        },
    },

    -- Todo Comments 待办注释
    {
        "folke/todo-comments.nvim",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "TodoTelescope", "TodoTrouble", "TodoQuickFix" },
        keys = {
            { "<leader>td", "<cmd>TodoTelescope<cr>", desc = "Todo Telescope" },
        },
        opts = {
            keywords = {
                FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "HACK" } },
                TODO = { icon = "⌦", color = "info" },
                NOTE = { icon = "⌥", color = "hint", alt = { "INFO" } },
                WARN = { icon = "⚠", color = "warning", alt = { "WARNING" } },
                PERF = { icon = "⚡", color = "hint", alt = { "OPTIM", "PERFORMANCE" } },
                TEST = { icon = "⏻", color = "test", alt = { "TESTING" } },
            },
        },
    },

    -- ToggleTerm 终端
    {
        "akinsho/toggleterm.nvim",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "ToggleTerm", "TermExec" },
        opts = {
            open_mapping = [[<c-\>]],
            direction = "float",
            float_opts = {
                border = "rounded",
            },
        },
    },

    -- Terminal GTD 终端任务管理（暂未安装）
    -- {
    --     "wendelcut/terminal-gtd",
    --     event = { "BufReadPost", "BufNewFile" },
    -- },

    -- Vim Be Good vim 练习（暂未安装）
    -- {
    --     "folke/vim-be-good",
    --     cmd = { "VimBeGood" },
    -- },

    -- Nushell 支持
    {
        "LhKipp/nvim-nu",
        ft = { "nu" },
        opts = {},
    },

    -- Conform 代码格式化
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "black", "isort" },
                rust = { "rustfmt" },
                go = { "gofmt", "goimports" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                json = { "jq" },
                yaml = { "yamlfmt" },
                markdown = { "markdown-toc", "prettier" },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
        },
    },

    -- Which-Key 快捷键提示
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            window = {
                border = "rounded",
                padding = { 1, 2, 1, 2 },
            },
        },
    },
}
