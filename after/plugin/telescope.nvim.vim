lua <<EOF
local actions = require('telescope.actions')

require('telescope').setup {
    defaults = {
        layout_config = {
            horizontal = {
                preview_width = 0.45,
                width = 0.95,
                height = 0.95
            }
        },
        mappings = {
            n = {
                ['<C-s>'] = actions.send_selected_to_qflist + actions.open_qflist
            },
            i = {
                ['<C-j>'] = require('telescope.actions').cycle_history_next,
                ['<C-k>'] = require('telescope.actions').cycle_history_prev,
                ['<C-s>'] = actions.send_selected_to_qflist + actions.open_qflist
            }
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true
        },
        media_files = {
            find_cmd = 'fdfind'
        }
    }
}
require('telescope').load_extension('fzy_native')
require('telescope').load_extension('media_files')
EOF
