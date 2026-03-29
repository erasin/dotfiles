local opt = vim.opt
local g = vim.g

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.wrap = false
opt.swapfile = false
opt.completeopt = "menu,menuone,noselect"
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.foldcolumn = "auto"
opt.fillchars = "eob: "
opt.showmode = false
opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.hidden = true
opt.backup = false
opt.writebackup = false
opt.updatetime = 200
opt.timeoutlen = 300
opt.redrawtime = 1500
opt.ttimeoutlen = 10
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.smartindent = true
opt.shiftround = true
opt.pumheight = 10
opt.conceallevel = 0
opt.splitright = true
opt.splitbelow = true
opt.eadirection = "hor"
opt.laststatus = 3
opt.cmdheight = 1
opt.whichwrap:append("<>[]hl")

vim.opt.formatoptions:remove("cro")
vim.opt.formatoptions:append("1")
vim.opt.formatoptions:append("2")
vim.opt.formatoptions:append("l")
vim.opt.formatoptions:append("n")
vim.opt.formatoptions:append("q")
vim.opt.formatoptions:append("r")
vim.opt.formatoptions:append("o")
vim.opt.formatoptions:append("t")
vim.opt.formatoptions:append("v")

g.mapleader = " "
g.maplocalleader = " "
g.markdown_fenced_languages = { "ts", "tsx", "js", "jsx", "json", "py", "bash", "sh", "zsh", "vim", "lua", "rust", "go" }

vim.filetype.add({
    extension = {
        mdx = "mdx",
        res = "cql",
    },
    filename = {
        ["Makefile"] = "makefile",
    },
    pattern = {},
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("LspAttach_Highlight", { clear = false }),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd("CursorHold", {
                buffer = args.buf,
                group = vim.api.nvim_create_augroup("LspAttach_Highlight", { clear = false }),
                callback = vim.lsp.buf.document_highlight,
                desc = "lsp document highlight",
            })
            vim.api.nvim_create_autocmd("CursorMoved", {
                buffer = args.buf,
                group = vim.api.nvim_create_augroup("LspAttach_Highlight", { clear = false }),
                callback = vim.lsp.buf.clear_references,
                desc = "lsp clear references",
            })
        end
    end,
})
