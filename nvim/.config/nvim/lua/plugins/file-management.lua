return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-fzy-native.nvim',
            'kyazdani42/nvim-web-devicons',
            'nvim-telescope/telescope-media-files.nvim',
            'nvim-telescope/telescope-ui-select.nvim'
        }
    },
    {
        'lambdalisue/fern.vim',
        branch = 'main',
        dependencies = {
            'lambdalisue/nerdfont.vim',
            'lambdalisue/glyph-palette.vim',
            'lambdalisue/fern-renderer-nerdfont.vim',
            'lambdalisue/fern-mapping-quickfix.vim',
            'lambdalisue/fern-git-status.vim'
        }
    },
}
