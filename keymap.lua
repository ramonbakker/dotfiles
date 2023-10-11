vim.keymap.set('n', '<Leader>f', '<cmd>Fern . -reveal=% -drawer -toggle -width=40<CR>')

vim.keymap.set('n', '<F3>', '<cmd>call pdv#DocumentWithSnip()<CR>')
vim.keymap.set('n', '<Leader>,', '<cmd>cprevious<CR>')
vim.keymap.set('n', '<Leader>.', '<cmd>cnext<CR>')
vim.keymap.set('n', '<Leader>lld', '<cmd>lua vim.diagnostic.setloclist()<CR>')
vim.keymap.set('n', '<C-p>', '<cmd>Telescope find_files find_command=fd,--type,f,--hidden,--exclude,.git<CR>')
vim.keymap.set('n', '<Leader><C-p>', '<cmd>Telescope find_files find_command=fd,--type,f,--hidden,--exclude,.git,--no-ignore-vcs<CR>')
vim.keymap.set('n', '<Leader>c', '<cmd>Telescope find_files cwd=%:p:h find_command=fd,--type,f,--hidden,--follow,--exclude,.git,--no-ignore-vcs<CR>')
vim.keymap.set('n', '<Leader>C', '<cmd>Telescope find_files cwd=%:p:h find_command=fd,--type,f,--hidden,--follow,--exclude,.git,--no-ignore-vcs,-d,1<CR>')
vim.keymap.set('n', '<Leader>m' , '<cmd>Telescope marks<CR>')
vim.keymap.set('n', '<Leader>ac', '<cmd>lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', '<Leader>hc', '<cmd>Telescope command_history<CR>')
vim.keymap.set('n', '<Leader>hs', '<cmd>Telescope search_history<CR>')
vim.keymap.set('n', '<Leader>lb', '<cmd>Telescope buffers<CR>')
vim.keymap.set('n', '<Leader>ld', '<cmd>Telescope diagnostics bufnr=0<CR>')
vim.keymap.set('n', '<Leader>li', '<cmd>Telescope lsp_implementations<CR>')
vim.keymap.set('n', '<Leader>ls', '<cmd>Telescope lsp_document_symbols<CR>')
vim.keymap.set('n', '<Leader>lf', '<cmd>Telescope lsp_document_symbols symbols=method<CR>')
vim.keymap.set('n', '<Leader>lg', '<cmd>Telescope live_grep<CR>')
vim.keymap.set('n', '<Leader>lr', '<cmd>silent Telescope lsp_references fname_width=80<CR>')
vim.keymap.set('n', '<Leader>lt', '<cmd>Telescope loclist<CR>')
vim.keymap.set('n', '<Leader>lm', '<cmd>Telescope media_files<CR>')
vim.keymap.set('n', '<Leader>lq', '<cmd>Telescope quickfix<CR>')
vim.keymap.set('n', '<Leader>gb', '<cmd>Telescope git_branches<CR>')
vim.keymap.set('n', '<Leader>gc', '<cmd>Telescope git_commits<CR>')
vim.keymap.set('n', '<Leader>h', '<cmd>Telescope oldfiles<CR>')
vim.keymap.set('n', '<Leader>t', '<cmd>Telescope lsp_workspace_symbols query=')
vim.keymap.set('n', '<Leader>/', '<cmd>Telescope current_buffer_fuzzy_find<CR>')

vim.keymap.set('n', '<Leader>ih', '<cmd>lua vim.lsp.inlay_hint(0)<CR>')

-- Sort selected lines by length
vim.keymap.set('v', '<Leader>sl', "!awk '{ print length, $0 }' | sort -n | cut -d ' ' -f 2-<CR>")
vim.keymap.set('v', '<Leader>slr', "!awk '{ print length, $0 }' | sort -nr | cut -d ' ' -f 2-<CR>")

-- vim-test
vim.keymap.set('n', '<Leader>tn', '<cmd>TestNearest<CR>')
vim.keymap.set('n', '<Leader>tf', '<cmd>TestFile<CR>')
vim.keymap.set('n', '<Leader>ts', '<cmd>TestSuite<CR>')
vim.keymap.set('n', '<Leader>tl', '<cmd>TestLast<CR>')
vim.keymap.set('n', '<Leader>tv', '<cmd>TestVisit<CR>')

-- Documentation: https://vim.fandom.com/wiki/Moving_lines_up_or_down
vim.keymap.set('n', '<A-j>', '<cmd>m .+1<CR>==')
vim.keymap.set('n', '<A-k>', '<cmd>m .-2<CR>==')
vim.keymap.set('i', '<A-j> <Esc>', '<cmd>m .+1<CR>==gi')
vim.keymap.set('i', '<A-k> <Esc>', '<cmd>m .-2<CR>==gi')
vim.keymap.set('v', '<A-j>', '<cmd>m >+1<CR>gv=gv')
vim.keymap.set('v', '<A-k>', '<cmd>m <-2<CR>gv=gv')

-- nvim-dap
vim.keymap.set('n', '<F5>', "<cmd>lua require'dap'.continue()<CR>", { silent = true })
vim.keymap.set('n', '<F10>', "<cmd>lua require'dap'.step_over()<CR>", { silent = true })
vim.keymap.set('n', '<F11>', "<cmd>lua require'dap'.step_into()<CR>", { silent = true })
vim.keymap.set('n', '<F12>', "<cmd>lua require'dap'.step_out()<CR>", { silent = true })
vim.keymap.set('n', '<Leader>sb', "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { silent = true })
vim.keymap.set('n', '<Leader>sB', "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", { silent = true })
vim.keymap.set('n', '<Leader>lp', "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", { silent = true })
vim.keymap.set('n', '<Leader>dr', "<cmd>lua require'dap'.repl.open()<CR>", { silent = true })
vim.keymap.set('n', '<Leader>dl', "<cmd>lua require'dap'.run_last()<CR>", { silent = true })
vim.keymap.set('n', '<Leader>dt', "<cmd>lua require'dap'.terminate()<CR>", { silent = true })
vim.keymap.set('n', '<Leader>do', "<cmd>lua require'dapui'.open()<CR>", { silent = true })
vim.keymap.set('n', '<Leader>dc', "<cmd>lua require'dapui'.close()<CR>", { silent = true })
vim.keymap.set('n', '<Leader>dC', "<cmd>lua require'dapui'.close(); require'dap'.terminate()<CR>", { silent = true })
