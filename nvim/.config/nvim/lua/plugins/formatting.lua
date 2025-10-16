return {
    {
        'prettier/vim-prettier',
        build = 'yarn install'
    },
    -- see https://github.com/stevearc/conform.nvim/issues/699
    -- 'stevearc/conform.nvim'
    {
        'vincentlabelle/conform.nvim',
        branch = 'fix-csharpier'
    }
}
