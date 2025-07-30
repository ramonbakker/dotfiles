return {
    'neovim/nvim-lspconfig',
    {
        'mason-org/mason-lspconfig.nvim',
        dependencies = {
            'mason-org/mason.nvim',
            'neovim/nvim-lspconfig'
        }
    },
    'mfussenegger/nvim-jdtls',
    {
        'seblyng/roslyn.nvim',
        ft = 'cs',
    }
}
