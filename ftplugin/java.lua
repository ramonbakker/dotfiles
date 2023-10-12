local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', '<Leader>oi', "<Cmd>lua require'jdtls'.organize_imports()<CR>", opts)

  require('jdtls').setup_dap({ hotcodereplace = 'auto' })
  require('jdtls.dap').setup_dap_main_class_configs()

  vim.lsp.inlay_hint(bufnr, true)
end

local bundles = {
  vim.fn.glob(os.getenv('HOME') .. '/java/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar', 1),
}

vim.list_extend(bundles, vim.split(vim.fn.glob(os.getenv('HOME') .. '/java/vscode-java-test/server/*.jar', 1), "\n"))

local jdtls = require('jdtls')

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.onCompletionItemSelectedCommand = 'editor.action.triggerParameterHints'
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = os.getenv('HOME') .. '/workspaces/' .. project_name

local config = {
    cmd = {
        os.getenv('HOME') .. '/.local/bin/jdtls',
        '--jvm-arg=-javaagent:' .. os.getenv('HOME') .. '/.m2/repository/org/projectlombok/lombok/1.18.26/lombok-1.18.26.jar',
        '-data', workspace_dir,
    },
    init_options = {
      bundles = bundles;
      extendedClientCapabilities = extendedClientCapabilities
    },
    filetypes = {
      'java',
    },
    settings = {
      java = {
        inlayHints = { parameterNames = { enabled = 'all' } }
      }
    },
    on_attach = on_attach
}

require('jdtls').start_or_attach(config)
