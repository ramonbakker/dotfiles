require('mason').setup({
    registries = {
        'github:mason-org/mason-registry',
        'github:crashdummyy/mason-registry',
    }
})
require('mason-lspconfig').setup({
    automatic_installation = true,
    ensure_installed = {
        'angularls',
        'emmet_ls',
        'html',
        'intelephense',
        'graphql',
        'kotlin_language_server',
        'cssls',
        'vue_ls',
        'jsonls',
        'yamlls',
        'dockerls',
        'pylsp',
        'lua_ls',
        'svelte',
        'ts_ls',
        'vue_ls',
        'docker_compose_language_service',
    }
})
require('mason-nvim-dap').setup({
    ensure_installed = {
        'firefox',
        'php',
    },
    automatic_installation = true,
    handlers = {
        function(config)
            require('mason-nvim-dap').default_setup(config)
        end,
        php = function(config)
            config.configurations = {
                {
                    type = 'php',
                    request = 'launch',
                    name = 'Listen for Xdebug',
                    port = 9003,
                }
            }

            require('mason-nvim-dap').default_setup(config)
        end,
    }
})

local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
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

    vim.lsp.inlay_hint.enable()

    vim.api.nvim_set_hl(0, 'LspInlayHint', {
        ctermfg = 'grey',
        fg = 'grey',
        cterm = {
            bold = true,
        },
        bold = true,
    })

    vim.lsp.codelens.refresh()

    vim.api.nvim_create_autocmd({ 'BufEnter', 'CursorHold', 'InsertLeave' }, {
        buffer = 0,
        callback = function()
            vim.lsp.codelens.refresh()
        end
    })
end

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local servers = {
    'intelephense',
    'graphql',
    'kotlin_language_server',
    'cssls',
    'vuels',
    'jsonls',
    'yamlls',
    'dockerls',
    'emmet_ls',
    'pylsp',
    'lua_ls',
    'svelte',
    'docker_compose_language_service',
}
local capabilities = require('blink.cmp').get_lsp_capabilities()

for _, lsp in ipairs(servers) do

  nvim_lsp[lsp].setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })
end

nvim_lsp.angularls.setup({
    capabilities = capabilities,
    root_dir = nvim_lsp.util.root_pattern('angular.json', 'nx.json'),
})

nvim_lsp.html.setup({
    capabilities = capabilities,
    filetypes = { 'html', 'twig' },
})

nvim_lsp.ts_ls.setup({
    capabilities = capabilities,
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

vim.lsp.config('roslyn', {
    on_attach = on_attach,
    settings = {
        ['csharp|inlay_hints'] = {
            csharp_enable_inlay_hints_for_implicit_object_creation = true,
            csharp_enable_inlay_hints_for_implicit_variable_types = true,
            csharp_enable_inlay_hints_for_lambda_parameter_types = true,
            csharp_enable_inlay_hints_for_types = false,
            dotnet_enable_inlay_hints_for_indexer_parameters = true,
            dotnet_enable_inlay_hints_for_literal_parameters = true,
            dotnet_enable_inlay_hints_for_object_creation_parameters = true,
            dotnet_enable_inlay_hints_for_other_parameters = true,
            dotnet_enable_inlay_hints_for_parameters = true,
            dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
            dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
            dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
        },
        ['csharp|code_lens'] = {
            dotnet_enable_references_code_lens = true
        }
    }
})
