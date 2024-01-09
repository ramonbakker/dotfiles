require('luasnip.loaders.from_snipmate').lazy_load({
    paths = os.getenv('HOME') .. '/.local/share/nvim/lazy/vim-snippets/snippets'
})
