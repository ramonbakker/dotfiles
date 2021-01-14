runtime coc.vimrc
runtime airline.vimrc
runtime syntastic.vimrc
runtime jest.vimrc
runtime vimify.vimrc

set number relativenumber
set colorcolumn=80,120
set termguicolors
set cursorline
set listchars=tab:>·,trail:~,extends:>,precedes:<,space:· 
set list
set tags+=$HOME/.config/nvim/tags/
set clipboard=unnamed
set clipboard=unnamedplus
set undofile
set tabstop=4
set shiftwidth=4
set expandtab

inoremap jj <Esc>
inoremap <C-M-i> <C-O>:call PhpInsertUse()<CR>
nnoremap <F2> :Fern . -reveal=% -drawer -toggle -width=40<CR>
nnoremap <F3> :call pdv#DocumentWithSnip()<CR>
nnoremap <C-p> :Files<CR>
nnoremap <Leader>c :Files %:p:h<CR>
nnoremap <Leader>lb :Buffers<CR>
nnoremap <Leader>ls :Vista finder coc<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>t :CocList --interactive --auto-preview symbols<CR>

" Sort selected lines by length
vnoremap <Leader>sl !awk '{ print length, $0 }' \| sort -n \| cut -d ' ' -f 2-<CR>
vnoremap <Leader>slr !awk '{ print length, $0 }' \| sort -nr \| cut -d ' ' -f 2-<CR>

nnoremap <Leader>s <Plug>Sneak_s
nnoremap <Leader>S <Plug>Sneak_S
noremap <Leader>; <Plug>Sneak_;
noremap <Leader>, <Plug>Sneak_,

" Documentation: https://vim.fandom.com/wiki/Moving_lines_up_or_down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Documentation: https://github.com/neoclide/coc-css#install
autocmd FileType scss setl iskeyword+=@-@

" Configuration for stephpy/vim-php-cs-fixer
" Install php-cs-fixer with 'composer global require friendsofphp/php-cs-fixer'
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()

autocmd BufWritePost *.php silent! PrettierAsync

let g:sneak#label = 1
let g:sneak#f_reset = 0
let g:sneak#t_reset = 0
let g:camelcasemotion_key = '<leader>'
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
let g:vim_json_syntax_conceal = 0
let g:jsonpath_register = 'j'
let g:pdv_template_dir = $HOME . "/.config/nvim/pdv_templates"
let g:jsdoc_templates_path = $HOME. "/.config/nvim/jsdoc_templates/default.js"
let g:jsdoc_formatter = 'tsdoc'
let g:fzf_layout = { 'window': { 'width': 1, 'height': 1 } }
let g:coc_global_extensions = [
	\'coc-json',
	\'coc-tsserver',
	\'coc-phpls',
	\'coc-css',
	\'coc-jest',
	\'coc-snippets',
	\'coc-lists',
	\'coc-html',
	\'coc-yaml',
	\'coc-highlight',
	\'coc-tabnine',
	\'coc-emmet',
	\'coc-angular',
	\'coc-pairs',
	\'coc-prettier'
	\]
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_guide_size = 1

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<C-n>'
let g:UltiSnipsJumpBackwardTrigger = '<C-p>'

let g:snipMate = { 'snippet_version' : 1 }

let g:fern#renderer = 'nerdfont'

call plug#begin(stdpath('data') . '/plugged')
Plug 'patstockwell/vim-monokai-tasty'
Plug 'othree/html5.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'ap/vim-css-color'
Plug 'airblade/vim-gitgutter'
Plug 'liuchengxu/vista.vim'
Plug 'xolox/vim-misc'
Plug 'vim-syntastic/syntastic'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'mogelbrod/vim-jsonpath', { 'on': 'JsonPath' }
Plug 'jparise/vim-graphql'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-mapping-quickfix.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-fugitive'
Plug 'tommcdo/vim-fubitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'editorconfig/editorconfig-vim'
Plug 'prettier/vim-prettier'
Plug 'mattn/emmet-vim'
Plug 'vim-vdebug/vdebug'
Plug 'SirVer/ultisnips'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'grvcoelho/vim-javascript-snippets'
Plug 'tobyS/vmustache'
Plug 'stephpy/vim-php-cs-fixer'
Plug '2072/PHP-Indenting-for-vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'ncm2/ncm2'
Plug 'noahfrederick/vim-composer'
Plug 'noahfrederick/vim-laravel'
Plug 'tobyS/pdv'
Plug 'c9s/phpunit.vim'
Plug 'leafgarland/typescript-vim'
Plug 'heavenshell/vim-jsdoc', {
	\ 'for': ['javascript', 'javascript.jsx', 'typescript'],
	\ 'do': 'make install'
\ }
Plug 'Quramy/vim-js-pretty-template'
Plug 'jason0x43/vim-js-indent'
Plug 'justinmk/vim-sneak'
Plug 'bkad/CamelCaseMotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vimwiki/vimwiki'
Plug 'tools-life/taskwiki'
Plug 'n0v1c3/vira', { 'do': './install.sh', 'on': 'ViraIssues' }
Plug 'HendrikPetertje/vimify'
" Plug 'nvim-treesitter/nvim-treesitter'
call plug#end()

colorscheme vim-monokai-tasty
let g:airline_theme = 'monokai_tasty'
let g:airline_powerline_fonts = 1
highlight LineNr ctermfg=white guifg=white
hi Normal guibg=None ctermbg=None

hi IndentGuidesOdd ctermbg=black
hi IndentGuidesEven ctermbg=black

" Overwrite part of
" https://github.com/junegunn/fzf.vim/blob/master/plugin/fzf.vim to follow
" symlinks
function! s:p(...)
  let preview_args = get(g:, 'fzf_preview_window', ['right', 'ctrl-/'])
  if empty(preview_args)
    return { 'options': ['--preview-window', 'hidden'] }
  endif

  " For backward-compatiblity
  if type(preview_args) == type('')
    let preview_args = [preview_args]
  endif
  return call('fzf#vim#with_preview', extend(copy(a:000), preview_args))
endfunction

command! -bang -nargs=* Rg call fzf#vim#grep("rg --follow --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1, s:p(), <bang>0)

" nvim-treesitter
" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"   highlight = {
"     enable = true,
"     use_languagetree = false, -- Use this to enable language injection (this is very unstable)
"     custom_captures = {
"     },
"   },
" }
" EOF

function! GetCocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

call airline#parts#define_function('coc_current_function', 'GetCocCurrentFunction')
let g:airline_section_x = airline#section#create_right(['coc_current_function', 'filetype'])

augroup glyph-palette
    autocmd! *
    autocmd FileType fern call glyph_palette#apply()
augroup END
