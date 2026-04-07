vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = { 80, 120 }
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.listchars = { tab = '>.', trail = '~', extends = '>', precedes = '<', space = '.' }
vim.opt.list = true
vim.opt.clipboard = { 'unnamed', 'unnamedplus' }
vim.opt.undofile = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 100
vim.opt.sessionoptions = { 'blank', 'buffers', 'curdir', 'folds', 'help', 'tabpages', 'winsize', 'resize' }
vim.opt.grepprg = 'rg --vimgrep'

vim.keymap.set('n', '<Space>', '<Nop>')
vim.g.mapleader = ' '

vim.g.camelcasemotion_key = '<Leader>'
vim.g.EditorConfig_exclude_patterns = { 'fugitive://.*', 'scp://.*' }
vim.g.jsonpath_register = 'j'
vim.g.pdv_template_dir = os.getenv('HOME') .. '/.config/nvim/pdv_templates'
vim.g.jsdoc_templates_path = os.getenv('HOME') .. '/.config/nvim/jsdoc_templates/default.js'
vim.g.jsdoc_formatter = 'tsdoc'
vim.g.indent_guides_enable_on_vim_startup = 0
vim.g.indent_guides_guide_size = 1
vim.g.matchup_matchparen_deferred = 1

vim.g.UltiSnipsExpandTrigger = '<tab>'
vim.g.UltiSnipsJumpForwardTrigger = '<C-n>'
vim.g.UltiSnipsJumpBackwardTrigger = '<C-p>'

vim.g['test#strategy'] = 'neovim'
vim.g['test#javascript#runner'] = 'jest'

vim.g.sonokai_enable_italic = 1
vim.g.sonokai_disable_italic_comment = 1
vim.g.sonokai_sign_column_background = 'none'
vim.g.sonokai_transparent_background = 1
vim.g.sonokai_diagnostic_text_highlight = 1
vim.g.sonokai_better_performance = 1

vim.diagnostic.config({
    virtual_text = true
})
