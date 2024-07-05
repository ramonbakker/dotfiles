vim.api.nvim_create_autocmd('BufWritePost', {
    pattern = '*.php',
    command = 'silent! !php-cs-fixer fix %',
})

vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = { '*.php', '*.java' },
    command = 'silent! lua vim.lsp.buf.format({ async = false })',
})
vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = { '*.ts', '*.html', '*.scss', '*.css', '*.json', '*.vue', '*.svelte' },
    command = 'silent! Prettier',
})

vim.api.nvim_create_autocmd('User', {
    pattern = 'TelescopePreviewerLoaded',
    command = 'silent! setlocal wrap',
})

vim.api.nvim_create_autocmd('TextYankPost', {
    pattern = '*',
    command = 'silent! lua vim.highlight.on_yank { timeout = 100 }',
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local opts = { buffer = ev.buf }

        vim.keymap.set('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        vim.keymap.set('n', 'gd', '<Cmd>Telescope lsp_definitions<CR>', opts)
        vim.keymap.set('n', '<Leader>i', '<Cmd>Telescope lsp_implementations<CR>', opts)
        vim.keymap.set('n', '<Leader>k', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        vim.keymap.set('i', '<C-s>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        vim.keymap.set('n', '<Leader>wa', '<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
        vim.keymap.set('n', '<Leader>wr', '<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
        vim.keymap.set('n', '<Leader>wl', '<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
        vim.keymap.set('n', '<Leader>D', '<Cmd>Telescope lsp_type_definitions<CR>', opts)
        vim.keymap.set('n', '<Leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
        vim.keymap.set('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
        vim.keymap.set('n', '<Leader>e', '<Cmd>lua vim.diagnostic.open_float()<CR>', opts)
        vim.keymap.set('n', '[d', '<Cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
        vim.keymap.set('n', ']d', '<Cmd>lua vim.diagnostic.goto_next()<CR>', opts)
        vim.keymap.set('n', '<Leader>q', '<Cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    end
})
