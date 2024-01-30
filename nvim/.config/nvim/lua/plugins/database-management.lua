return {
    {
        'tpope/vim-dadbod',
        lazy = true
    },
    {
        'kristijanhusak/vim-dadbod-ui',
        dependencies = {
            {
                'tpope/vim-dadbod',
                lazy = true
            },
            {
                'kristijanhusak/vim-dadbod-completion',
                ft = {
                    'sql',
                    'mysql',
                    'plsql'
                },
                lazy = true
            }
        },
        cmd = {
            'DBUI',
            'DBUIToggle',
            'DBUIAddConnection',
            'DBUIFindBuffer',
        },
        init = function()
            vim.api.nvim_create_autocmd('User', {
                pattern = 'DBUIOpened',
                command = 'setlocal number relativenumber'
            })
        end
    }
}
