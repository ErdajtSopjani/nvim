local M = {}

function M.setup()
  -- See `:help cmp`
  local cmp = require 'cmp'
  local luasnip = require 'luasnip'
  luasnip.config.setup {}

  cmp.setup {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    completion = { completeopt = 'menu,menuone,noinsert' },

    -- For an understanding of why these mappings were
    -- chosen, you will need to read `:help ins-completion`
    --
    -- No, but seriously. Please read `:help ins-completion`, it is really good!
    mapping = cmp.mapping.preset.insert {
      -- Select the [n]ext item
      ['<M-n>'] = cmp.mapping.select_next_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      -- Select the [p]revious item
      ['<M-p>'] = cmp.mapping.select_prev_item(),
      ['<C-p>'] = cmp.mapping.select_prev_item(),

      -- scroll the documentation window
      -- [b]ack
      ['<M-b>'] = cmp.mapping.select_next_item(),
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      -- [f]orward
      ['<M-f>'] = cmp.mapping.select_next_item(),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),

      -- Accept ([y]es) the completion.
      --  This will auto-import if your LSP supports it.
      --  This will expand snippets if the LSP sent a snippet.
      ['<M-y>'] = cmp.mapping.confirm { select = true },
      ['<C-y>'] = cmp.mapping.confirm { select = true },

      -- Manually trigger a completion from nvim-cmp.
      --  Generally you don't need this, because nvim-cmp will display
      --  completions whenever it has completion options available.
      ['<C-Space>'] = cmp.mapping.complete {},

      -- Think of <c-l> as moving to the right of your snippet expansion.
      --  So if you have a snippet that's like:
      --  function $name($args)
      --    $body
      --  end
      --
      -- <c-l> will move you to the right of each of the expansion locations.
      ['<M-l>'] = cmp.mapping(function()
        if luasnip.expand_or_locally_jumpable() then
          luasnip.expand_or_jump()
        end
      end, { 'i', 's' }),
      ['<C-l>'] = cmp.mapping(function()
        if luasnip.expand_or_locally_jumpable() then
          luasnip.expand_or_jump()
        end
      end, { 'i', 's' }),

      -- <c-h> is similar, except moving you backwards.
      ['<M-h>'] = cmp.mapping(function()
        if luasnip.locally_jumpable(-1) then
          luasnip.jump(-1)
        end
      end, { 'i', 's' }),

      ['<C-h>'] = cmp.mapping(function()
        if luasnip.locally_jumpable(-1) then
          luasnip.jump(-1)
        end
      end, { 'i', 's' }),

      -- For more advanced luasnip keymaps (e.g. selecting choice nodes, expansion) see:
      --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'vim-dadbod-completion' },
      { name = 'luasnip' },
      { name = 'path' },
      { name = 'buffer', keyword_length = 5 },
    },
  }
end

return M
