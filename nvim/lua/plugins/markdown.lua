-- Markdown 插件配置
-- 包含 vim-markdown、render-markdown、markdown-preview 等插件

return {
    -- Vim Markdown 语法高亮
    {
        "preservim/vim-markdown",
        ft = { "markdown" },
        opts = {
            mkdp_page_title = "{{name}}",
        },
    },

    -- Render Markdown Markdown 渲染
    {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = { "markdown" },
        opts = {},
    },

    -- Markdown Preview Markdown 预览
    {
        "iamcco/markdown-preview.nvim",
        build = function()
            vim.cmd("cd app && npm install && npm audit fix")
        end,
        ft = { "markdown" },
    },
}
