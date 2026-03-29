-- LSP 服务器配置
-- 包含各语言 LSP 服务器的详细配置

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

-- LSP 通用选项
local opts = {
    noremap = true,
    silent = true,
    buffer = true,
}

-- LSP 附加回调函数
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    -- 跳转到定义、声明、引用等（Helix 风格）
    buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gh", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)

    -- 禁用格式化（由 conform.nvim 处理）
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_buf_set_var(bufnr, "format_disabled", true)
    end

    -- illuminate 插件支持
    require("illuminate").on_attach(client)
end

-- LSP 能力配置
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = { "documentation", "detail", "additionalTextEdits" },
}

-- LSP 服务器列表
local servers = {
    "clangd",
    "gopls",
    "pyright",
    "rust_analyzer",
    "ts_ls",
    "html",
    "cssls",
    "emmet_ls",
    "jsonls",
    "yamlls",
    "graphql",
    "taplo",
    "sqlls",
    "prismals",
}

-- 配置各 LSP 服务器
for _, server in ipairs(servers) do
    local server_opts = {
        on_attach = on_attach,
        capabilities = capabilities,
    }

    -- 服务器特定配置
    if server == "pyright" then
        server_opts.settings = {
            python = {
                analysis = {
                    autoSearchPaths = true,
                    diagnosticMode = "workspace",
                    useLibraryCodeForTypes = true,
                    typeCheckingMode = "basic",
                },
            },
        }
    elseif server == "gopls" then
        server_opts.settings = {
            gopls = {
                analyses = {
                    unusedparams = true,
                },
                staticcheck = true,
            },
        }
    elseif server == "rust_analyzer" then
        server_opts.settings = {
            ["rust-analyzer"] = {
                cargo = {
                    loadOutDirsFromCheck = true,
                },
                checkOnSave = {
                    command = "clippy",
                },
            },
        }
    end

    local has_server, _ = pcall(lspconfig[server].setup, server_opts)
end

-- Fidget 插件配置
require("fidget").setup({})

-- Trouble 插件配置
require("trouble").setup()

-- 诊断配置
vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

-- LSP 处理器配置
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    signs = true,
    update_in_insert = false,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
})
