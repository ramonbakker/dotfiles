lua <<EOF
local actions = require('telescope.actions')

require('telescope').setup {
    defaults = {
        layout_defaults = {
            horizontal = {
                preview_width = 0.4
            }
        },
        mappings = {
            i = {
                ["<C-q>"] = actions.send_to_qflist
            },
            n = {
                ["<C-q>"] = actions.send_to_qflist
            }
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true
        }
    }
}
require('telescope').load_extension('fzy_native')
EOF
