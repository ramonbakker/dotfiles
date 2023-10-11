vim.api.nvim_create_augroup('GlyphPalette', {})
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'fern',
    command = 'call glyph_palette#apply()',
    group = 'GlyphPalette'
})
