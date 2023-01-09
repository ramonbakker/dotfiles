lua <<EOF
  local cmp = require('cmp')
  local lspkind = require('lspkind')
  cmp.setup {
    snippet = {
      expand = function(args)
        -- You must install `vim-vsnip` if you use the following as-is.
        vim.fn['UltiSnips#Anon'](args.body)
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
      { name = 'ultisnips' },
      { name = 'nvim_lsp' },
      { name = 'dap' },
      { name = 'path' },
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
      format = function(entry, vim_item)
      vim_item.kind = lspkind.presets.default[vim_item.kind] .. ' ' .. vim_item.kind

      vim_item.menu = ({
        ultisnips = '[Ultisnips]',
        nvim_lsp = '[LSP]',
        dap = '[DAP]',
        path = '[Path]',
        treesitter = '[Treesitter]',
        buffer = '[Buffer]',
        calc = '[Calc]',
      })[entry.source.name]

      local detail = entry:get_completion_item().detail

      if detail == nil then
          detail = ''
      else
          detail = ' ' .. detail
      end

      if vim_item.menu ~= nil then
          vim_item.menu = vim_item.menu .. detail
      end

      return vim_item
      end
    }
  }
EOF

" Setup buffer configuration (nvim-lua source only enables in Lua filetype).
autocmd FileType lua lua require'cmp'.setup.buffer {
\   sources = {
\     { name = 'buffer' },
\     { name = 'nvim_lua' },
\   },
\ }
