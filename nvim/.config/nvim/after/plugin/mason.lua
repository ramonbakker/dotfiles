require('mason').setup()
require('mason-lspconfig').setup {
    automatic_installation = true,
}

local nvim_lsp = require('lspconfig')
local configs = require('lspconfig/configs')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead gui=bold
      hi LspReferenceText gui=bold
      hi LspReferenceWrite gui=bold
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end

  if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint ~= nil then
    vim.lsp.inlay_hint(bufnr, true)
  end
end

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local servers = { 'intelephense', 'graphql', 'kotlin_language_server', 'cssls', 'vuels', 'jsonls', 'yamlls', 'dockerls', 'emmet_ls', 'pylsp', 'lua_ls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

nvim_lsp.angularls.setup{
    root_dir = nvim_lsp.util.root_pattern('angular.json', 'nx.json'),
}

nvim_lsp.html.setup{
    filetypes = { 'html', 'twig' },
}

nvim_lsp.tsserver.setup({
    on_attach = on_attach,
    settings = {
        typescript = {
            inlayHints = {
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = true,
            }
        }
    }
})
