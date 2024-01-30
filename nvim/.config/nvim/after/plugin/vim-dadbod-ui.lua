vim.g.db_ui_use_nerd_fonts = true
vim.g.db_ui_auto_execute_table_helpers = true

vim.api.nvim_create_autocmd('User', {
    pattern = 'DBUIOpened',
    command = 'setlocal number relativenumber'
})
