-- 自动命令配置
-- 包含文件类型检测、终端设置、窗口事件等自动命令

-- LspAttach 自动命令：为支持 LSP 高亮的文件启用文档高亮
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("LspAttach_Highlight", { clear = false }),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd("CursorHold", {
                buffer = args.buf,
                group = vim.api.nvim_create_augroup("LspAttach_Highlight", { clear = false }),
                callback = vim.lsp.buf.document_highlight,
                desc = "LSP 文档高亮",
            })
            vim.api.nvim_create_autocmd("CursorMoved", {
                buffer = args.buf,
                group = vim.api.nvim_create_augroup("LspAttach_Highlight", { clear = false }),
                callback = vim.lsp.buf.clear_references,
                desc = "LSP 清除高亮引用",
            })
        end
    end,
})

-- FileType 自动命令：禁用所有文件的折叠、拼写检查和自动换行
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.foldenable = false
        vim.opt_local.foldmethod = "manual"
        vim.opt_local.spell = false
        vim.opt_local.wrap = false
    end,
})

-- TermOpen 自动命令：终端专用设置
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.foldcolumn = "0"
        vim.opt_local.winhighlight = "Normal:Normal"
    end,
})

-- WinEnter 自动命令：NvimTree 窗口不显示行号
vim.api.nvim_create_autocmd("WinEnter", {
    pattern = "*",
    callback = function()
        if vim.bo.filetype == "NvimTree" then
            vim.opt_local.number = false
            vim.opt_local.relativenumber = false
        end
    end,
})

-- FileType 自动命令：特殊文件类型（退出快捷键）
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "qf", "help", "man", "lspinfo", "spectre_panel" },
    callback = function()
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = true })
        vim.keymap.set("n", "<esc>", "<cmd>close<cr>", { buffer = true })
    end,
})

-- FileType 自动命令：Git 提交信息设置
vim.api.nvim_create_autocmd("FileType", {
    pattern = "gitcommit",
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.textwidth = 72
    end,
})

-- FileType 自动命令：Markdown 文件设置
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.textwidth = 80
        vim.opt_local.wrap = true
    end,
})
