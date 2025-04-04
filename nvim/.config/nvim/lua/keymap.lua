vim.keymap.set('n', '<Leader>f', '<Cmd>Oil<CR>')

vim.keymap.set('n', '<F3>', '<Cmd>call pdv#DocumentWithSnip()<CR>')
vim.keymap.set('n', '<Leader>,', '<Cmd>cprevious<CR>')
vim.keymap.set('n', '<Leader>.', '<Cmd>cnext<CR>')
vim.keymap.set('n', '<Leader>lld', '<Cmd>lua vim.diagnostic.setloclist()<CR>')
vim.keymap.set('n', '<C-p>', '<Cmd>Telescope find_files find_command=fd,--type,f,--hidden,--exclude,.git<CR>')
vim.keymap.set('n', '<Leader><C-p>', '<Cmd>Telescope find_files find_command=fd,--type,f,--hidden,--exclude,.git,--no-ignore-vcs<CR>')
vim.keymap.set('n', '<Leader>c', function()
    return '<Cmd>Telescope find_files cwd=%:p' .. string.rep(':h', vim.v.count1) .. ' find_command=fd,--type,f,--hidden,--follow,--exclude,.git,--no-ignore-vcs<CR>'
end, { expr = true })
vim.keymap.set('n', '<Leader>C', '<Cmd>Telescope find_files cwd=%:p:h find_command=fd,--type,f,--hidden,--follow,--exclude,.git,--no-ignore-vcs,-d,1<CR>')
vim.keymap.set('n', '<Leader>m' , '<Cmd>Telescope marks<CR>')
vim.keymap.set('n', '<Leader>ac', '<Cmd>lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', '<Leader>hc', '<Cmd>Telescope command_history<CR>')
vim.keymap.set('n', '<Leader>hs', '<Cmd>Telescope search_history<CR>')
vim.keymap.set('n', '<Leader>lb', '<Cmd>Telescope buffers<CR>')
vim.keymap.set('n', '<Leader>ld', '<Cmd>Telescope diagnostics bufnr=0<CR>')
vim.keymap.set('n', '<Leader>li', '<Cmd>Telescope lsp_implementations<CR>')
vim.keymap.set('n', '<Leader>ls', '<Cmd>Telescope lsp_document_symbols<CR>')
vim.keymap.set('n', '<Leader>lf', '<Cmd>Telescope lsp_document_symbols symbols=method<CR>')
vim.keymap.set('n', '<Leader>lg', '<Cmd>lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>')
vim.keymap.set('n', '<Leader>lr', '<Cmd>silent Telescope lsp_references fname_width=80<CR>')
vim.keymap.set('n', '<Leader>lt', '<Cmd>Telescope loclist<CR>')
vim.keymap.set('n', '<Leader>lm', '<Cmd>Telescope media_files<CR>')
vim.keymap.set('n', '<Leader>lq', '<Cmd>Telescope quickfix<CR>')
vim.keymap.set('n', '<Leader>gb', '<Cmd>Telescope git_branches<CR>')
vim.keymap.set('n', '<Leader>gc', '<Cmd>Telescope git_commits<CR>')
vim.keymap.set('n', '<Leader>h', '<Cmd>Telescope oldfiles<CR>')
vim.keymap.set('n', '<Leader>t', ':Telescope lsp_workspace_symbols query=')
vim.keymap.set('n', '<Leader>/', '<Cmd>Telescope current_buffer_fuzzy_find<CR>')

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
