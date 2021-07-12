lua <<EOF
local actions = require('telescope.actions')

require('telescope').setup {
    defaults = {
        layout_config = {
            horizontal = {
                preview_width = 0.4
            }
        },
        mappings = {
            i = {
                ['<C-s>'] = actions.send_selected_to_qflist + actions.open_qflist
            },
            n = {
                ['<C-s>'] = actions.send_selected_to_qflist + actions.open_qflist
            },
            i = {
                ['<C-j>'] = require('telescope.actions').cycle_history_next,
                ['<C-k>'] = require('telescope.actions').cycle_history_prev
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
