lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
    },
  },
  indent = {
    enable = true
  },
}
EOF
