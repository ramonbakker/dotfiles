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

  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint(bufnr, true)
  end
end

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local servers = { "intelephense", "graphql", "html", "kotlin_language_server", "cssls", "vuels", "jsonls", "yamlls", "dockerls", "emmet_ls", "pylsp" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach, capabilities = capabilities }
end

local project_library_path = os.getenv( "HOME" ) .. "/.config/yarn/global/node_modules"
local cmd = { os.getenv( "HOME" ) .. "/.yarn/bin/ngserver", "--stdio", "--tsProbeLocations", project_library_path, "--ngProbeLocations", project_library_path }

nvim_lsp.angularls.setup{
    cmd = cmd,
    capabilities = capabilities,
    root_dir = nvim_lsp.util.root_pattern("angular.json", "nx.json"),
    on_new_config = function(new_config,new_root_dir)
        new_config.cmd = cmd
    end,
}

nvim_lsp.tsserver.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        typescript = {
            inlayHints = {
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = true,
            }
        }
    }
})
