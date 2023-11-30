vim.api.nvim_create_autocmd('FileType', {
    pattern = 'vue',
    command = 'setlocal commentstring=//%s'
})
