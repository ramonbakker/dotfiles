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
set completeopt=menuone,noinsert

inoremap jj <Esc>
inoremap <C-M-i> <C-O>:call PhpInsertUse()<CR>
nnoremap <F2> :Fern . -reveal=% -drawer -toggle -width=40<CR>
nnoremap <F3> :call pdv#DocumentWithSnip()<CR>
nnoremap <C-p> :Telescope find_files find_command=fdfind,--type,f,--hidden,--follow,--exclude,.git<CR>
nnoremap <Leader>c :Telescope find_files cwd=%:p:h find_command=fdfind,--type,f,--hidden,--follow,--exclude,.git<CR>
nnoremap <Leader>ac :Telescope lsp_code_actions<CR>
nnoremap <Leader>lb :Telescope buffers<CR>
nnoremap <Leader>ls :Telescope lsp_document_symbols<CR>
nnoremap <Leader>gb :Telescope git_branches<CR>
nnoremap <Leader>h :Telescope oldfiles<CR>
nnoremap <Leader>t :Telescope lsp_workspace_symbols query=

" completion-nvim
" Documentation: https://github.com/nvim-lua/completion-nvim#changing-completion-confirm-key
imap <expr> <CR> pumvisible() ? complete_info()["selected"] != "-1" ?
    \ "\<Plug>(completion_confirm_completion)" : "\<c-e>\<CR>" : "\<CR>"

" Sort selected lines by length
vnoremap <Leader>sl !awk '{ print length, $0 }' \| sort -n \| cut -d ' ' -f 2-<CR>
vnoremap <Leader>slr !awk '{ print length, $0 }' \| sort -nr \| cut -d ' ' -f 2-<CR>

" vim-sneak
nmap <Leader>s <Plug>Sneak_s
nmap <Leader>S <Plug>Sneak_S
nmap <Leader>; <Plug>Sneak_;
nmap <Leader>, <Plug>Sneak_,

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

command -nargs=* Rg Telescope grep_string search=<args>

" Configuration for stephpy/vim-php-cs-fixer
" Install php-cs-fixer with 'composer global require friendsofphp/php-cs-fixer'
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()

autocmd BufWritePost *.php silent! lua vim.lsp.buf.formatting_sync()
autocmd BufWritePost *.ts,*.html,*.scss,*.css,*.json silent! Prettier

autocmd BufEnter * lua require'completion'.on_attach()

autocmd User TelescopePreviewerLoaded setlocal wrap

let g:sneak#label = 1
let g:sneak#f_reset = 0
let g:sneak#t_reset = 0
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

let g:completion_enable_snippet = 'UltiSnips'

let g:fern#renderer = 'nerdfont'

let g:test#strategy = 'neovim'
let g:test#javascript#runner = 'jest'

let g:completion_confirm_key = ""
let g:completion_chain_complete_list = {
    \'default': [
    \   {'complete_items': ['lsp', 'snippet', 'tabnine']},
    \   {'mode': '<c-p>'},
    \   {'mode': '<c-pn'}
    \]
\}
let g:completion_tabnine_sort_by_details = 1

call plug#begin(stdpath('data') . '/plugged')
" Dependencies
Plug 'tobyS/vmustache' " tobyS/pdv
Plug 'lambdalisue/glyph-palette.vim' " lambdalisue/nerdfont.vim, lambdalisue/fern-renderer-nerdfont.vim
Plug 'lambdalisue/nerdfont.vim' " lambdalisue/fern-renderer-nerdfont.vim
Plug 'lambdalisue/fern-renderer-nerdfont.vim' " lambdalisue/fern.vim
Plug 'lambdalisue/fern-git-status.vim' " lambdalisue/fern.vim
Plug 'lambdalisue/fern-mapping-quickfix.vim' " lambdalisue/fern.vim
Plug 'ryanoasis/vim-devicons' " vim-airline/vim-airline
Plug 'tommcdo/vim-fubitive' " tpope/vim-fugitive
Plug 'tpope/vim-dispatch' " noahfrederick/vim-laravel
Plug 'tpope/vim-projectionist' " noahfrederick/vim-laravel
Plug 'nvim-lua/popup.nvim' " nvim-telescope/telescope.nvim
Plug 'nvim-lua/plenary.nvim' " nvim-telescope/telescope.nvim
Plug 'nvim-telescope/telescope-fzy-native.nvim' " nvim-telescope/telescope.nvim
Plug 'kyazdani42/nvim-web-devicons' " nvim-telescope/telescope.nvim

" Theming
Plug 'sainnhe/sonokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
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

" Utilities
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'mbbill/undotree'
Plug 'jiangmiao/auto-pairs'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Syntax
Plug 'vim-syntastic/syntastic'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" File management
Plug 'nvim-telescope/telescope.nvim'
Plug 'lambdalisue/fern.vim'

" Testing
Plug 'vim-test/vim-test'

" Debugging
Plug 'vim-vdebug/vdebug'

" Completion
Plug 'nvim-lua/completion-nvim'
Plug 'aca/completion-tabnine', { 'do': './install.sh' }

" Snippets
Plug 'SirVer/ultisnips'
Plug 'HerringtonDarkholme/yats.vim'

" Code style helpers
Plug 'stephpy/vim-php-cs-fixer'
Plug 'editorconfig/editorconfig-vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Motions
Plug 'bkad/CamelCaseMotion'
Plug 'justinmk/vim-sneak'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

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

let g:airline_theme = 'sonokai'
let g:airline_powerline_fonts = 1

hi LineNr ctermfg=white guifg=white
hi Normal guibg=None ctermbg=None

hi IndentGuidesOdd ctermbg=black
hi IndentGuidesEven ctermbg=black

hi link LspDiagnosticsVirtualTextError Red
hi link LspDiagnosticsVirtualTextWarning Orange

runtime nvim-treesitter.vimrc
runtime nvim-lsp.vimrc
runtime nvim-web-devicons.vimrc
runtime fern.vimrc
runtime airline.vimrc
runtime syntastic.vimrc
