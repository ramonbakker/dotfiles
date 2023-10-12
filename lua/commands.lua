-- Configuration for stephpy/vim-php-cs-fixer
-- Install php-cs-fixer with 'composer global require friendsofphp/php-cs-fixer'
vim.api.nvim_create_autocmd('BufWritePost', {
    pattern = '*.php',
    command = '!silent call PhpCsFixerFixFile()',
})

vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = { '*.php', '*.java' },
    command = '!silent lua vim.lsp.buf.formatting_sync()',
})
vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = { '*.ts', '*.html', '*.scss', '*.css', '*.json' },
    command = '!silent Prettier',
})

vim.api.nvim_create_autocmd('User', {
    pattern = 'TelescopePreviewerLoaded',
    command = '!silent setlocal wrap',
})

vim.api.nvim_create_autocmd('TextYankPost', {
    pattern = '*',
    command = 'silent! lua vim.highlight.on_yank { timeout = 100 }',
})
