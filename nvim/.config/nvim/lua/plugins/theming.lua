return {
    {
        'sainnhe/sonokai',
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme sonokai]])
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        }
    },
    'nathanaelkane/vim-indent-guides',
}
