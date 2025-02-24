local blink = require('blink.cmp')

blink.setup({
    keymap = {
        preset = 'enter'
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
    }
})
