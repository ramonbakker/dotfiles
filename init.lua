require('options')
require('highlight-groups')
require('keymap')
require('commands')

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    -- Theming
    {
        'sainnhe/sonokai',
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme sonokai]])
        end,
    },
    {
        'itchyny/lightline.vim',
        dependencies = {
            'ryanoasis/vim-devicons'
        }
    },
    'nathanaelkane/vim-indent-guides',

    -- PHP
    {
        'tobyS/pdv',
        dependencies = {
            'tobyS/vmustache'
        }
    },
    'noahfrederick/vim-composer',

    -- HTML
    'alvan/vim-closetag',

    -- CSS
    'ap/vim-css-color',

    -- GraphQL
    'jparise/vim-graphql',

    -- Kotlin
    'udalov/kotlin-vim',

    -- JSON
    'mogelbrod/vim-jsonpath',

    -- LaTeX
    'lervag/vimtex',

    -- Utilities
    'mattn/emmet-vim',
    'kylechui/nvim-surround',
    'tpope/vim-commentary',
    'mbbill/undotree',
    'windwp/nvim-autopairs',

    -- LSP
    'neovim/nvim-lspconfig',

    -- Syntax
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },

    -- File management
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

    -- Testing
    'vim-test/vim-test',

    -- Debugging
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',

    -- Completion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-calc',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'hrsh7th/cmp-nvim-lua',
            'rcarriga/cmp-dap',
            'quangnguyen30192/cmp-nvim-ultisnips',
            'onsails/lspkind-nvim'
        }
    },

    -- Snippets
    'SirVer/ultisnips',
    'HerringtonDarkholme/yats.vim',

    -- Code style helpers
    'stephpy/vim-php-cs-fixer',
    {
        'prettier/vim-prettier',
        build = 'yarn install'
    },

    -- Motions
    'bkad/CamelCaseMotion',
    'nvim-treesitter/nvim-treesitter-textobjects',

    -- Git
    {
        'lewis6991/gitsigns.nvim',
        dependencies = 'nvim-lua/plenary.nvim'
    },
    {
        'tpope/vim-fugitive',
        dependencies = {
            'tommcdo/vim-fubitive'
        }
    },
    'junegunn/gv.vim',

    -- Database
    'tpope/vim-dadbod',

    -- Project management
    'vimwiki/vimwiki',
    'tools-life/taskwiki',
    {
        'n0v1c3/vira',
        build = './install.sh',
        cmd = 'ViraIssues'
    },

    -- General
    'christoomey/vim-tmux-navigator',
})
