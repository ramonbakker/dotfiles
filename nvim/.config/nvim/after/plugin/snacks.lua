require('snacks').setup {
    bigfile = { enabled = false },
    dashboard = { enabled = false },
    explorer = { enabled = false },
    indent = { enabled = false },
    input = { enabled = false },
    notifier = { enabled = false },
    picker = {
        enabled = true,
        layout = {
            layout = {
                width = 0.95,
                height = 0.95,
            }
        },
        formatters = {
            file = {
                truncate = 80
            }
        }
    },
    quickfile = { enabled = false },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
}
