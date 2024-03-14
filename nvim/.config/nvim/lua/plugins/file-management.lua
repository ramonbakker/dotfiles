return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-fzy-native.nvim',
            {
                'kyazdani42/nvim-web-devicons',
                name = 'kyazdani42_nvim-web-devicons'
            },
            'nvim-telescope/telescope-media-files.nvim',
            'nvim-telescope/telescope-ui-select.nvim'
        }
    },
    {
        'stevearc/oil.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        }
    },
}
