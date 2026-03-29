-- Treesitter 配置
-- 语法高亮、增量选择、文本对象配置

local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

treesitter.setup({
    ensure_installed = {
        "bash",
        "c",
        "cpp",
        "css",
        "go",
        "html",
        "javascript",
        "json",
        "json5",
        "lua",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "rust",
        "toml",
        "prisma",
        "sql",
        "graphql",
    },
    highlight = {
        enable = true,
        use_languagetree = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            scope_incremental = false,
            node_decremental = "<BS>",
        },
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["aa"] = "@parameter.outer",
                ["ia"] = "@parameter.inner",
                ["ai"] = "@conditional.outer",
                ["ii"] = "@conditional.inner",
                ["al"] = "@loop.outer",
                ["il"] = "@loop.inner",
                ["at"] = "@comment.outer",
                ["it"] = "@comment.inner",
            },
        },
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                ["]f"] = "@function.outer",
                ["]c"] = "@class.outer",
                ["]a"] = "@parameter.inner",
            },
            goto_next_end = {
                ["]F"] = "@function.outer",
                ["]C"] = "@class.outer",
                ["]A"] = "@parameter.inner",
            },
            goto_previous_start = {
                ["[f"] = "@function.outer",
                ["[c"] = "@class.outer",
                ["[a"] = "@parameter.inner",
            },
            goto_previous_end = {
                ["[F"] = "@function.outer",
                ["[C"] = "@class.outer",
                ["[A"] = "@parameter.inner",
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ["<leader>."] = "@parameter.inner",
                ["<leader>,"] = "@function.outer",
            },
            swap_previous = {
                ["<leader>>"] = "@parameter.inner",
                ["<leader><"] = "@function.outer",
            },
        },
    },
})

-- Treesitter 重复移动配置
local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)
vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
