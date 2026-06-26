return {
    {
        'yetone/avante.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'MunifTanjim/nui.nvim',
            {
                'MeanderingProgrammer/render-markdown.nvim',
                opts = {
                    file_types = { 'markdown', 'Avante' },
                },
                ft = { 'markdown', 'Avante' }
            },
            'zbirenbaum/copilot.lua',
            'copilotlsp-nvim/copilot-lsp',
        },
        build = 'make',
        event = 'VeryLazy',
        version = false
    }
}
