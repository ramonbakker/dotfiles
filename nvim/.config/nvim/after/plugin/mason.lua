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

vim.g.dotnet_get_project_name = function(projectPath)
        return string.gsub(string.gsub(projectPath, '.*/', ''), '.csproj', '')
end

vim.g.dotnet_set_proj_path = function()
    if vim.g['dotnet_last_proj_path'] ~= nil and vim.fn.confirm('Change project [current: ' .. vim.g.dotnet_get_project_name(vim.g['dotnet_last_proj_path']) .. ']?', '&yes\n&no', 2) ~= 1 then
        return vim.g['dotnet_last_proj_path']
    end

    local projects = vim.fn.glob(vim.fn.getcwd() .. '**/*.csproj', false, true)

    local list = {
        'Select project:'
    }

    for i, project in ipairs(projects) do
        table.insert(list, i .. '. ' .. vim.g.dotnet_get_project_name(project))
    end

    local projectNumber = vim.fn.inputlist(list)

    if projectNumber == 0 then
        return nil
    end

    local chosenProject = projects[projectNumber]

    vim.g['dotnet_last_proj_path'] = chosenProject

    return vim.g['dotnet_last_proj_path']
end

vim.g.dotnet_build_project = function()
    local cmd = 'dotnet build -c Debug ' .. vim.g['dotnet_last_proj_path']
    local f = os.execute(cmd)

    if f ~= 0 then
        print('\nBuild: ❌ (code: ' .. f .. ')')
    end
end

vim.g.dotnet_get_dll_path = function()
    local projectPath = string.gsub(vim.g['dotnet_last_proj_path'], '(.*)/.*.csproj', '%1')

    return vim.fn.glob(projectPath .. '/bin/Debug/net*/' .. vim.g.dotnet_get_project_name(vim.g['dotnet_last_proj_path']) .. '.dll', false, false)
end

require('mason-nvim-dap').setup({
    ensure_installed = {
        'firefox',
        'php',
        'coreclr',
        'netcoredbg',
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
        coreclr = function(config)
            config.configurations = {
                {
                    type = "coreclr",
                    name = "launch - netcoredbg",
                    request = "launch",
                    env = {
                        ASPNETCORE_ENVIRONMENT="Development",
                        ASPNETCORE_URLS = "https://localhost:5000"
                    },
                    -- Set cwd for appsettings.json
                    cwd = function()
                        if vim.g['dotnet_last_proj_path'] == nil then
                            vim.g.dotnet_set_proj_path()
                        end

                        return string.gsub(vim.g['dotnet_last_proj_path'], '(.*)/.*.csproj', '%1')
                    end,
                    args = function ()
                        if vim.g['dotnet_last_proj_path'] ~= nil and string.find(vim.g['dotnet_last_proj_path'], 'Tests') ~= nil then
                            return {}
                        end

                        return {
                            "/p:EnvironmentName=Development",
                            "--environment=Development"
                        }
                    end,
                    program = function()
                        if vim.g.dotnet_set_proj_path() == nil then
                            return
                        end

                        vim.g.dotnet_build_project()

                        return vim.g.dotnet_get_dll_path()
                    end,
                }
            }

            require('mason-nvim-dap').default_setup(config)
        end,
    }
})

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
    'angularls',
    'intelephense',
    'graphql',
    'kotlin_language_server',
    'cssls',
    'jsonls',
    'yamlls',
    'dockerls',
    'pylsp',
    'lua_ls',
    'svelte',
    'docker_compose_language_service',
}
local capabilities = require('blink.cmp').get_lsp_capabilities()

for _, lsp in ipairs(servers) do

  vim.lsp.config(lsp, {
        capabilities = capabilities,
        on_attach = on_attach,
    })
end

vim.lsp.config('emmet_ls', {
    capabilities = capabilities,
    filetypes = { 'html', 'css', 'sass', 'scss', 'less', 'vue', 'svelte', 'javascript', 'razor' }
})

vim.lsp.config('html', {
    capabilities = capabilities,
    filetypes = { 'html', 'twig' },
})

vim.lsp.config('ts_ls', {
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
