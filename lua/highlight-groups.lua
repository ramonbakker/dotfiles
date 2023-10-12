vim.api.nvim_set_hl(0, 'Normal', {
    ctermbg = 'None',
    bg = 'None'
})

vim.api.nvim_set_hl(0, 'IndentGuidesOdd', {
    ctermbg = 'black',
})
vim.api.nvim_set_hl(0, 'IndentGuidesEven', {
    ctermbg = 'black',
})

vim.api.nvim_set_hl(0, 'LspInlayHint', {
    ctermfg = 'grey',
    fg = 'grey',
    cterm = {
        italic = true,
        bold = true
    },
    italic = true,
    bold = true
})
vim.api.nvim_set_hl(0, 'IndentGuidesEven', {
    ctermbg = 'black',
})
vim.api.nvim_set_hl(0, 'IndentGuidesEven', {
    ctermbg = 'black',
})

vim.api.nvim_set_hl(0, 'Red', {
    link = 'LspDiagnosticsVirtualTextError',
})
vim.api.nvim_set_hl(0, 'Orange', {
    link = 'LspDiagnosticsVirtualTextWarning',
})

vim.api.nvim_set_hl(0, 'MatchWord', {
    ctermbg = 237,
    bg = '#414550',
    cterm = {
        bold = true
    },
    bold = true
})
vim.api.nvim_set_hl(0, 'MatchWordCur', {
    ctermbg = 237,
    bg = '#414550',
    cterm = {
        bold = true
    },
    bold = true
})
