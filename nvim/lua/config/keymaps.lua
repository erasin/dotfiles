local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true })
keymap("", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true })
keymap("", "$", "g$", opts)
keymap("", "0", "g0", opts)
keymap("", "^", "g^", opts)

keymap("n", "H", "^", opts)
keymap("n", "L", "$", opts)

keymap("n", "<leader><tab>", "<c-^>", opts)

keymap({ "n", "v" }, "%", "<cmd>call matchit#Match_wrapper('',1,'n')<cr>", opts)

keymap("n", "gt", "gT", opts)
keymap("n", "gT", "<cmd>tabprevious<cr>", opts)

keymap({ "n", "v" }, "gx", "<cmd>bnext<cr>", opts)

keymap("n", "]", "]", opts)
keymap("n", "[", "[", opts)

keymap("n", "<c-q>", "<cmd>bd<cr>", opts)
keymap("n", "<leader>q", "<cmd>bd<cr>", opts)
keymap("n", "<leader>Q", "<cmd>bd!<cr>", opts)
keymap("n", "<leader>w", "<cmd>w<cr>", opts)
keymap("n", "<leader>W", "<cmd>wa<cr>", opts)
keymap("n", "<leader>wq", "<cmd>wqa<cr>", opts)

keymap({ "n", "v" }, "d", '"_d', opts)
keymap({ "n", "v" }, "D", '"_D', opts)
keymap({ "n", "v" }, "c", '"_c', opts)
keymap({ "n", "v" }, "C", '"_C', opts)
keymap({ "n", "v" }, "x", '"_x', opts)
keymap({ "n", "v" }, "X", '"_X', opts)

keymap({ "n", "v" }, "y", "y", opts)
keymap({ "n", "v" }, "Y", "y$", opts)
keymap({ "n", "v" }, "p", '"0p', opts)
keymap({ "n", "v" }, "P", '"0P', opts)

keymap("n", "Q", "<cmd>qa!<cr>", opts)
keymap("n", "<leader>Q", "<cmd>qa!<cr>", opts)

keymap({ "n", "v" }, ".", ".<cr>zv", opts)
keymap({ "n", "v" }, "u", "u", opts)
keymap({ "n", "v" }, "U", "<c-r>", opts)

keymap("n", "<c-a>", "0", opts)
keymap("n", "<c-x>", "$", opts)
keymap("n", "<c-s>", "<cmd>w<cr>", opts)

keymap("i", "<c-a>", "<c-o>0", opts)
keymap("i", "<c-x>", "<c-o>$", opts)
keymap("i", "<c-d>", "<cmd>mz`.<cr>", opts)
keymap("i", "<c-t>", "<cmd>mz`>`<cr>", opts)
keymap("i", "<c-j>", "<c-j>", opts)
keymap("i", "<c-k>", "<c-r>", opts)
keymap("i", "<c-c>", "<esc>", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "J", ":m '>+1<cr>gv=gv", opts)
keymap("v", "K", ":m '<-2<cr>gv=gv", opts)

keymap("c", "<c-p>", "<up>", opts)
keymap("c", "<c-n>", "<down>", opts)
keymap("c", "<c-b>", "<left>", opts)
keymap("c", "<c-f>", "<right>", opts)
keymap("c", "<c-a>", "<home>", opts)
keymap("c", "<c-e>", "<end>", opts)
keymap("c", "<c-d>", "<del>", opts)
keymap("c", "<c-h>", "<bs>", opts)
keymap("c", "<c-t>", "<c-n>", opts)

keymap("t", "<c-j>", "<c-n>", opts)
keymap("t", "<c-k>", "<c-p>", opts)
keymap("t", "<c-h>", "<left>", opts)
keymap("t", "<c-l>", "<right>", opts)
keymap("t", "<c-a>", "<home>", opts)
keymap("t", "<c-e>", "<end>", opts)
keymap("t", "<c-d>", "<del>", opts)
keymap("t", "<c-b>", "<bs>", opts)
keymap("t", "<c-f>", "<right>", opts)
keymap("t", "<esc>", "<c-\\><c-n>", opts)
keymap("t", "<c-q>", "<c-\\><c-n>", opts)
keymap("t", "<c-c>", "<c-\\><c-n>", opts)

keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", opts)
keymap("n", "<leader>fc", "<cmd>Telescope commands<cr>", opts)
keymap("n", "<leader>f.", "<cmd>Telescope current_buffer_fuzzy_find<cr>", opts)
keymap("n", "<leader>f/", "<cmd>Telescope search_history<cr>", opts)

keymap("n", "<leader>nt", "<cmd>NvimTreeToggle<cr>", opts)
keymap("n", "<leader>nf", "<cmd>NvimTreeFindFile<cr>", opts)
keymap("n", "<leader>nc", "<cmd>NvimTreeCollapse<cr>", opts)
keymap("n", "<leader>nr", "<cmd>NvimTreeRefresh<cr>", opts)

-- 空格 + e 打开文件浏览器
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)

keymap("n", "<leader>bb", "<cmd>e #<c-r>=bufnr('$')<cr><cr>", opts)
keymap("n", "<leader>bd", "<cmd>bp<bar>sp<bar>bn<bar>bd<cr>", opts)
keymap("n", "<leader>bD", "<cmd>bp<bar>sp<bar>bn<bar>bd!<cr>", opts)
keymap("n", "<leader>bo", "<cmd>only<cr>", opts)
keymap("n", "<leader>ba", "<cmd>bufdo bd<cr>", opts)

keymap("n", "<leader>th", "<cmd>set hlsearch!<cr>", opts)
keymap("n", "<leader>tn", "<cmd>set number!<cr>", opts)
keymap("n", "<leader>tr", "<cmd>set relativenumber!<cr>", opts)
keymap("n", "<leader>tw", "<cmd>set wrap!<cr>", opts)

keymap("n", "<leader>zz", "<cmd>VimBeGood<cr>", opts)

keymap("n", "<leader>cc", "<cmd>e ~/.config/nvim/init.lua<cr>", opts)
keymap("n", "<leader>ck", "<cmd>e ~/.config/nvim/lua/config/keymaps.lua<cr>", opts)

keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
keymap("n", "gK", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)

keymap("n", "<c-]>", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)

keymap("n", "<leader>ld", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
keymap("n", "[e", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
keymap("n", "]e", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
keymap("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", opts)

require("which-key").register({
    ["<leader>"] = {
        f = { name = "+file/find" },
        g = { name = "+git" },
        b = { name = "+buffer" },
        t = { name = "+toggle" },
        c = { name = "+config" },
        n = { name = "+nvim-tree" },
    },
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.foldenable = false
        vim.opt_local.foldmethod = "manual"
        vim.opt_local.spell = false
        vim.opt_local.wrap = false
    end,
})

vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.foldcolumn = "0"
        vim.opt_local.winhighlight = "Normal:Normal"
    end,
})

vim.api.nvim_create_autocmd("WinEnter", {
    pattern = "*",
    callback = function()
        if vim.bo.filetype == "NvimTree" then
            vim.opt_local.number = false
            vim.opt_local.relativenumber = false
        end
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "qf", "help", "man", "lspinfo", "spectre_panel" },
    callback = function()
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = true })
        vim.keymap.set("n", "<esc>", "<cmd>close<cr>", { buffer = true })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "gitcommit",
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.textwidth = 72
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.textwidth = 80
        vim.opt_local.wrap = true
    end,
})
