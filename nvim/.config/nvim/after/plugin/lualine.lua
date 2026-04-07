require('lualine').setup({
    options = {
        theme = 'onedark',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' }
    },
    sections = {
        lualine_c = {
            {
                'filetype',
                icon_only = true,
                padding = { left = 1, right = 0 }
            },
            {
            'filename',
                path = 3
            }
        },
        lualine_x = {
            'encoding',
            'fileformat',
            {
                'filetype',
                icons_enabled = false
            }
        }
    },
    inactive_sections = {
        lualine_c = {
            {
                'filetype',
                icon_only = true,
                padding = { left = 1, right = 0 }
            },
            {
            'filename',
                path = 3
            }
        }
    },
    tabline = {
        lualine_a = {
            {
                'tabs',
                mode = 2,
            }
        }
    }
})
