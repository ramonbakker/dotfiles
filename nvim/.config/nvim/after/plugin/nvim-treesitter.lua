require'nvim-treesitter.configs'.setup {
    ensure_installed = {
      'php',
      'typescript',
      'jsdoc',
      'html',
      'css',
      'graphql',
      'yaml',
      'json',
      'bash',
      'regex',
      'http',
      'lua',
      'twig',
      'vue',
      'java',
    },
    auto_install = true,
    highlight = {
        enable = true,
        custom_captures = {
        },
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = 'gnn',
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = 'grm'
        }
    },
    indent = {
        enable = true
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ['<Leader>aa'] = '@attribute.outer',
                ['<Leader>ia'] = '@attribute.inner',
                ['aa'] = '@parameter.outer',
                ['ia'] = '@parameter.inner',
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
            }
        },
        swap = {
            enable = true,
            swap_next = {
                ['<Leader>sa'] = '@parameter.inner',
            },
            swap_previous = {
                ['<Leader>sA'] = '@parameter.inner',
            }
        },
        matchup = {
            enable = true,
        },
    }
}
