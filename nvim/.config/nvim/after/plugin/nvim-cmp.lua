local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
local lspkind = require('lspkind')
cmp.setup {
  snippet = {
    expand = function(args)
        require('luasnip').lsp_expand(args.body)
    end
  },

  -- You must set mapping if you want.
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- You should specify your *installed* sources.
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'dap' },
    { name = 'path' },
    { name = 'vim-dadbod-completion' },
    { name = 'buffer' },
    { name = 'calc' },
    { name = 'nvim_lsp_signature_help' },
  }),

  enabled = function ()
    return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
      or require("cmp_dap").is_dap_buffer()
  end,

  completion = {
    completeopt = 'menu,menuone,noinsert',
  },

  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text",
      menu = {
        nvim_lsp = '[LSP]',
        luasnip = '[LuaSnip]',
        dap = '[DAP]',
        path = '[Path]',
        treesitter = '[Treesitter]',
        buffer = '[Buffer]',
        calc = '[Calc]',
      }
    })
  }
}

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

-- Setup buffer configuration (nvim-lua source only enables in Lua filetype).

vim.api.nvim_create_autocmd('FileType', {
    pattern = '*.lua',
    command = [[lua require'cmp'.setup.buffer { 
        sources = {
            { name = 'buffer' },
            { name = 'nvim_lua' },
        }
    }]],
})
