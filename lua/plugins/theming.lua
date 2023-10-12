return {
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
}
