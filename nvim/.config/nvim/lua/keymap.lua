vim.keymap.set('n', '<Leader>f', '<Cmd>Oil<CR>')

vim.keymap.set('n', '<F3>', '<Cmd>call pdv#DocumentWithSnip()<CR>')
vim.keymap.set('n', '<Leader>lld', '<Cmd>lua vim.diagnostic.setloclist()<CR>')
vim.keymap.set('n', '<C-p>', '<Cmd>lua Snacks.picker.files({ hidden = true })<CR>')
vim.keymap.set('n', '<Leader><C-p>', '<Cmd>lua Snacks.picker.files({ hidden = true, ignored = true })<CR>')
vim.keymap.set('n', '<Leader>c', function()
    return Snacks.picker.files({
        hidden = true,
        ignored = true,
        dirs = { vim.fn.expand('%:p'.. string.rep(':h', vim.v.count1)) },
    })
end)
vim.keymap.set('n', '<Leader>F', function()
    return Snacks.picker.files({
        hidden = true,
        ignored = true,
        dirs = { vim.fn.expand('%:p'.. string.rep(':h', vim.v.count1)) },
        search = vim.fn.expand('%:t:r'),
        exclude = { vim.fn.expand('%:t') },
        auto_confirm = true
    })
end)
vim.keymap.set('n', '<Leader>m' , '<Cmd>lua Snacks.picker.marks()<CR>')
vim.keymap.set('n', '<Leader>hc', '<Cmd>lua Snacks.picker.command_history()<CR>')
vim.keymap.set('n', '<Leader>hs', '<Cmd>lua Snacks.picker.search_history()<CR>')
vim.keymap.set('n', '<Leader>lb', '<Cmd>lua Snacks.picker.buffers()<CR>')
vim.keymap.set('n', '<Leader>ld', '<Cmd>lua Snacks.picker.diagnostics_buffer()<CR>')
vim.keymap.set('n', '<Leader>li', '<Cmd>lua Snacks.picker.lsp_implementations()<CR>')
vim.keymap.set('n', '<Leader>ls', '<Cmd>lua Snacks.picker.lsp_symbols()<CR>')
vim.keymap.set('n', '<Leader>lf', '<Cmd>lua Snacks.picker.lsp_symbols({ filter = { default = { "Function", "Method" } } })<CR>')
vim.keymap.set('n', '<Leader>lg', '<Cmd>lua Snacks.picker.grep()<CR>')
vim.keymap.set('n', '<Leader>lt', '<Cmd>lua Snacks.picker.loclist()<CR>')
vim.keymap.set('n', '<Leader>lq', '<Cmd>lua Snacks.picker.qflist()<CR>')
vim.keymap.set('n', '<Leader>gb', '<Cmd>lua Snacks.picker.git_branches()<CR>')
vim.keymap.set('n', '<Leader>gl', '<Cmd>lua Snacks.picker.git_log()<CR>')
vim.keymap.set('n', '<Leader>gs', '<Cmd>lua Snacks.picker.git_status()<CR>')
vim.keymap.set('n', '<Leader>h', '<Cmd>lua Snacks.picker.recent()<CR>')
vim.keymap.set('n', '<Leader>t', '<Cmd>lua Snacks.picker.lsp_workspace_symbols()<CR>')
vim.keymap.set('n', '<Leader>/', '<Cmd>lua Snacks.picker.lines()<CR>')

vim.keymap.set('n', '<Leader>ih', '<Cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>')

-- Sort selected lines by length
vim.keymap.set('v', '<Leader>sl', "!awk '{ print length, $0 }' | sort -n | cut -d ' ' -f 2-<CR>")
vim.keymap.set('v', '<Leader>slr', "!awk '{ print length, $0 }' | sort -nr | cut -d ' ' -f 2-<CR>")

-- vim-test
vim.keymap.set('n', '<Leader>tn', '<Cmd>TestNearest<CR>')
vim.keymap.set('n', '<Leader>tf', '<Cmd>TestFile<CR>')
vim.keymap.set('n', '<Leader>ts', '<Cmd>TestSuite<CR>')
vim.keymap.set('n', '<Leader>tl', '<Cmd>TestLast<CR>')
vim.keymap.set('n', '<Leader>tv', '<Cmd>TestVisit<CR>')

-- Documentation: https://vim.fandom.com/wiki/Moving_lines_up_or_down
vim.keymap.set('n', '<A-j>', '<Cmd>m .+1<CR>==')
vim.keymap.set('n', '<A-k>', '<Cmd>m .-2<CR>==')
vim.keymap.set('i', '<A-j> <Esc>', '<Cmd>m .+1<CR>==gi')
vim.keymap.set('i', '<A-k> <Esc>', '<Cmd>m .-2<CR>==gi')
vim.keymap.set('v', '<A-j>', '<Cmd>m >+1<CR>gv=gv')
vim.keymap.set('v', '<A-k>', '<Cmd>m <-2<CR>gv=gv')

-- nvim-dap
vim.keymap.set('n', '<F5>', "<Cmd>lua require'dap'.continue()<CR>", { silent = true })
vim.keymap.set('n', '<F10>', "<Cmd>lua require'dap'.step_over()<CR>", { silent = true })
vim.keymap.set('n', '<F11>', "<Cmd>lua require'dap'.step_into()<CR>", { silent = true })
vim.keymap.set('n', '<F12>', "<Cmd>lua require'dap'.step_out()<CR>", { silent = true })
vim.keymap.set('n', '<Leader>sb', "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", { silent = true })
vim.keymap.set('n', '<Leader>sB', "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", { silent = true })
vim.keymap.set('n', '<Leader>lp', "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", { silent = true })
vim.keymap.set('n', '<Leader>dr', "<Cmd>lua require'dap'.repl.open()<CR>", { silent = true })
vim.keymap.set('n', '<Leader>dl', "<Cmd>lua require'dap'.run_last()<CR>", { silent = true })
vim.keymap.set('n', '<Leader>dt', "<Cmd>lua require'dap'.terminate()<CR>", { silent = true })
vim.keymap.set('n', '<Leader>do', "<Cmd>lua require'dapui'.open()<CR>", { silent = true })
vim.keymap.set('n', '<Leader>dc', "<Cmd>lua require'dapui'.close()<CR>", { silent = true })
vim.keymap.set('n', '<Leader>dC', "<Cmd>lua require'dapui'.close(); require'dap'.terminate()<CR>", { silent = true })

-- vim-dadbod
vim.keymap.set('n', '<Leader>db', '<Cmd>DBUIToggle<CR>')

-- rest.nvim
vim.keymap.set('n', '<Leader>hr', '<Cmd>Rest run<CR>')
