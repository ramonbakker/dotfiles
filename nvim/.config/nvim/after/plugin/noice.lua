require("noice").setup({
    lsp = {
        progress = {
            enabled = false,
        },
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
        },
    },
    cmdline = {
        enabled = false
    },
    messages = {
        enabled = false
    },
    notify = {
        enabled = false
    },
})
