set number relativenumber
set colorcolumn=80,120
set termguicolors
set cursorline
set listchars=tab:>·,trail:~,extends:>,precedes:<,space:· 
set list
set clipboard=unnamed
set clipboard=unnamedplus
set undofile
set tabstop=4
set shiftwidth=4
set expandtab
set hidden
set nobackup
set nowritebackup
set signcolumn=yes
set updatetime=300
set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize,resize

nnoremap <Leader>f :Fern . -reveal=% -drawer -toggle -width=40<CR>
nnoremap <F3> :call pdv#DocumentWithSnip()<CR>
nnoremap <Leader>, :cprevious<CR>
nnoremap <Leader>. :cnext<CR>
nnoremap <C-p> :Telescope find_files find_command=fdfind,--type,f,--hidden,--exclude,.git<CR>
nnoremap <Leader><C-p> :Telescope find_files find_command=fdfind,--type,f,--hidden,--exclude,.git,--no-ignore-vcs<CR>
nnoremap <Leader>c :Telescope find_files cwd=%:p:h find_command=fdfind,--type,f,--hidden,--follow,--exclude,.git,--no-ignore-vcs<CR>
nnoremap <Leader>m :Telescope marks<CR>
nnoremap <Leader>ac :lua vim.lsp.buf.code_action()<CR>
nnoremap <Leader>hc :Telescope command_history<CR>
nnoremap <Leader>hs :Telescope search_history<CR>
nnoremap <Leader>lb :Telescope buffers<CR>
nnoremap <Leader>li :Telescope lsp_implementations<CR>
nnoremap <Leader>ls :Telescope lsp_document_symbols<CR>
nnoremap <Leader>lf :Telescope lsp_document_symbols symbols=method<CR>
nnoremap <Leader>lg :Telescope live_grep<CR>
nnoremap <Leader>lr :silent Telescope lsp_references fname_width=80<CR>
nnoremap <Leader>lt :Telescope loclist<CR>
nnoremap <Leader>lm :Telescope media_files<CR>
nnoremap <Leader>lq :Telescope quickfix<CR>
nnoremap <Leader>gb :Telescope git_branches<CR>
nnoremap <Leader>gc :Telescope git_commits<CR>
nnoremap <Leader>h :Telescope oldfiles<CR>
nnoremap <Leader>t :Telescope lsp_workspace_symbols query=
nnoremap <Leader>/ :Telescope current_buffer_fuzzy_find<CR>

" Sort selected lines by length
vnoremap <Leader>sl !awk '{ print length, $0 }' \| sort -n \| cut -d ' ' -f 2-<CR>
vnoremap <Leader>slr !awk '{ print length, $0 }' \| sort -nr \| cut -d ' ' -f 2-<CR>

" hop.nvim
nmap <Leader>hw :HopWord<CR>

" vim-test
nmap <Leader>tn :TestNearest<CR>
nmap <Leader>tf :TestFile<CR>
nmap <Leader>ts :TestSuite<CR>
nmap <Leader>tl :TestLast<CR>
nmap <Leader>tv :TestVisit<CR>

" Documentation: https://vim.fandom.com/wiki/Moving_lines_up_or_down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" nvim-dap
nnoremap <silent> <F5> <Cmd>lua require'dap'.continue()<CR>
nnoremap <silent> <F10> <Cmd>lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> <Cmd>lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> <Cmd>lua require'dap'.step_out()<CR>
nnoremap <silent> <Leader>sb <Cmd>lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <Leader>sB <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>
nnoremap <silent> <Leader>dt <Cmd>lua require'dap'.terminate()<CR>

nnoremap <silent> <Leader>do <Cmd>lua require'dapui'.open()<CR>
nnoremap <silent> <Leader>dc <Cmd>lua require'dapui'.close()<CR>
nnoremap <silent> <Leader>dC <Cmd>lua require'dapui'.close(); require'dap'.terminate()<CR>

command -nargs=* Rg Telescope grep_string search=<args>

" Configuration for stephpy/vim-php-cs-fixer
" Install php-cs-fixer with 'composer global require friendsofphp/php-cs-fixer'
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()

autocmd BufWritePre *.php silent! lua vim.lsp.buf.formatting_sync()
autocmd BufWritePre *.ts,*.html,*.scss,*.css,*.json silent! Prettier

autocmd User TelescopePreviewerLoaded setlocal wrap

au TextYankPost * silent! lua vim.highlight.on_yank {timeout=150}

let g:camelcasemotion_key = '<Leader>'
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
let g:jsonpath_register = 'j'
let g:pdv_template_dir = $HOME . '/.config/nvim/pdv_templates'
let g:jsdoc_templates_path = $HOME. '/.config/nvim/jsdoc_templates/default.js'
let g:jsdoc_formatter = 'tsdoc'
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_guide_size = 1

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<C-n>'
let g:UltiSnipsJumpBackwardTrigger = '<C-p>'

let g:fern#renderer = 'nerdfont'

let g:test#strategy = 'neovim'
let g:test#javascript#runner = 'jest'

let g:lightline = {
    \ 'colorscheme': 'deus',
    \ 'active': {
    \   'left': [['mode', 'paste'],
    \       ['git_branch', 'readonly', 'file_icon_and_path', 'modified']]
    \ },
    \ 'inactive': {
    \   'left': [['file_icon_and_path', 'modified']],
    \   'right': [['lineinfo'], ['percent']]
    \ },
    \ 'component': {
    \   'file_icon_and_path': '%<%{LightlineFileIconAndPath()}'
    \ },
    \ 'component_function': {
    \   'git_branch': 'LightlineGitBranch'
    \ }
\ }
let g:lightline.tab_component_function = {
    \ 'filename': 'lightline#tab#filename',
    \ 'modified': 'lightline#tab#modified',
    \ 'readonly': 'lightline#tab#readonly',
    \ 'tabnum': 'lightline#tab#tabnum',
    \ 'file_icon_and_path': 'LightlineTabActiveFileIconAndName'
\ }
let g:lightline.tab = {
    \ 'active': ['tabnum', 'file_icon_and_path', 'modified'],
    \ 'inactive': ['tabnum', 'file_icon_and_path', 'modified'],
\ }

call plug#begin(stdpath('data') . '/plugged')
" Dependencies
Plug 'tobyS/vmustache' " tobyS/pdv
Plug 'lambdalisue/glyph-palette.vim' " lambdalisue/nerdfont.vim, lambdalisue/fern-renderer-nerdfont.vim
Plug 'lambdalisue/nerdfont.vim' " lambdalisue/fern-renderer-nerdfont.vim
Plug 'lambdalisue/fern-renderer-nerdfont.vim' " lambdalisue/fern.vim
Plug 'lambdalisue/fern-git-status.vim' " lambdalisue/fern.vim
Plug 'lambdalisue/fern-mapping-quickfix.vim' " lambdalisue/fern.vim
Plug 'ryanoasis/vim-devicons' " itchyny/lightline.vim
Plug 'tommcdo/vim-fubitive' " tpope/vim-fugitive
Plug 'tpope/vim-dispatch' " noahfrederick/vim-laravel
Plug 'tpope/vim-projectionist' " noahfrederick/vim-laravel
Plug 'nvim-lua/popup.nvim' " nvim-telescope/telescope.nvim
Plug 'nvim-lua/plenary.nvim' " nvim-telescope/telescope.nvim, lewis6991/gitsigns.nvim
Plug 'nvim-telescope/telescope-fzy-native.nvim' " nvim-telescope/telescope.nvim
Plug 'kyazdani42/nvim-web-devicons' " nvim-telescope/telescope.nvim
Plug 'nvim-telescope/telescope-media-files.nvim' " nvim-telescope/telescope.nvim
Plug 'nvim-telescope/telescope-ui-select.nvim' " nvim-telescope/telescope.nvim
Plug 'hrsh7th/cmp-nvim-lsp' " hrsh7th/nvim-cmp
Plug 'hrsh7th/cmp-calc' " hrsh7th/nvim-cmp
Plug 'hrsh7th/cmp-path' " hrsh7th/nvim-cmp
Plug 'hrsh7th/cmp-buffer' " hrsh7th/nvim-cmp
Plug 'hrsh7th/cmp-nvim-lua' " hrsh7th/nvim-cmp
Plug 'quangnguyen30192/cmp-nvim-ultisnips' " hrsh7th/nvim-cmp
Plug 'onsails/lspkind-nvim' " hrsh7th/nvim-cmp

" Theming
Plug 'sainnhe/sonokai'
Plug 'itchyny/lightline.vim'
Plug 'nathanaelkane/vim-indent-guides'

" PHP
Plug 'tobyS/pdv'
Plug 'noahfrederick/vim-composer'
Plug 'noahfrederick/vim-laravel'

" TypeScript/JavaScript
Plug 'heavenshell/vim-jsdoc', {
    \ 'for': ['javascript', 'javascript.jsx', 'typescript'],
    \ 'do': 'make install'
\ }

" HTML
Plug 'alvan/vim-closetag'

" CSS
Plug 'ap/vim-css-color'

" GraphQL
Plug 'jparise/vim-graphql'

" JSON
Plug 'mogelbrod/vim-jsonpath', { 'on': 'JsonPath' }

" LaTeX
Plug 'lervag/vimtex'

" Utilities
Plug 'mattn/emmet-vim'
Plug 'kylechui/nvim-surround'
Plug 'tpope/vim-commentary'
Plug 'mbbill/undotree'
Plug 'Raimondi/delimitMate'

" LSP
Plug 'neovim/nvim-lspconfig'

" Syntax
Plug 'vim-syntastic/syntastic'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" File management
Plug 'nvim-telescope/telescope.nvim'
Plug 'lambdalisue/fern.vim', {'branch:': 'main'}

" Testing
Plug 'vim-test/vim-test'

" Debugging
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'

" Completion
Plug 'hrsh7th/nvim-cmp'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'HerringtonDarkholme/yats.vim'

" Code style helpers
Plug 'stephpy/vim-php-cs-fixer'
Plug 'editorconfig/editorconfig-vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Motions
Plug 'bkad/CamelCaseMotion'
Plug 'phaazon/hop.nvim'

" Git
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" Database
Plug 'tpope/vim-dadbod'

" Project management
Plug 'vimwiki/vimwiki'
Plug 'tools-life/taskwiki'
Plug 'n0v1c3/vira', { 'do': './install.sh', 'on': 'ViraIssues' }

" General
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
let g:sonokai_sign_column_background = 'none'
let g:sonokai_transparent_background = 1
let g:sonokai_diagnostic_text_highlight = 1
let g:sonokai_better_performance = 1

colorscheme sonokai

hi LineNr ctermfg=white guifg=white
hi Normal ctermbg=None guibg=None 

hi IndentGuidesOdd ctermbg=black
hi IndentGuidesEven ctermbg=black

hi link LspDiagnosticsVirtualTextError Red
hi link LspDiagnosticsVirtualTextWarning Orange

runtime nvim-treesitter.vimrc
runtime nvim-lsp.vimrc
runtime nvim-dap.vimrc
runtime nvim-dapui.vimrc
runtime nvim-dap-virtual-text.vimrc
runtime nvim-web-devicons.vimrc
runtime nvim-cmp.vimrc
runtime nvim-surround.vimrc
runtime fern.vimrc
runtime lightline.vimrc
runtime syntastic.vimrc
runtime gitsigns.vimrc
