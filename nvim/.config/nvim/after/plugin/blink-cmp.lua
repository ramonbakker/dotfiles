local blink = require('blink.cmp')

blink.setup({
    keymap = {
        preset = 'enter',
        ['<C-k>'] = {},
    },
    completion = {
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 100
        },
        list = {
            selection = {
                preselect = false
            }
        },
        menu = {
            draw = {
                columns = {
                    {
                        'label',
                        'label_description',
                        gap = 1
                    },
                    {
                        'kind_icon',
                        'kind',
                        gap = 1
                    },
                    {
                        'source_name'
                    }
                }
            }
        }
    },
    signature = {
        enabled = true
    },
    sources = {
        per_filetype = {
            sql = {
                'snippets',
                'dadbod',
                'buffer'
            }
        },
        providers = {
            dadbod = {
                name = 'Dadbod',
                module = 'vim_dadbod_completion.blink'
            }
        }
    },
})
