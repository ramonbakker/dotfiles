local actions = require('telescope.actions')
local action_layout = require('telescope.actions.layout')

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
                ['<C-s>'] = actions.send_selected_to_qflist + actions.open_qflist,
                ['<C-h>'] = action_layout.toggle_preview
            },
            i = {
                ['<C-j>'] = actions.cycle_history_next,
                ['<C-k>'] = actions.cycle_history_prev,
                ['<C-s>'] = actions.send_selected_to_qflist + actions.open_qflist,
                ['<C-h>'] = action_layout.toggle_preview
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
require("telescope").load_extension('ui-select')
require("telescope").load_extension('live_grep_args')
