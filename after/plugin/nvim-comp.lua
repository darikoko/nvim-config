local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()  -- Move to the next item in the completion menu
      else
        fallback()  -- If no completion menu is visible, fallback to default behavior
      end
    end, { "i", "s" }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()  -- Move to the previous item in the completion menu
      else
        fallback()  -- If no completion menu is visible, fallback to default behavior
      end
    end, { "i", "s" }),

    ['<CR>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm({ select = true })  -- Accept the currently selected item
      else
        cmp.complete()  -- Trigger the completion menu if it’s not visible
      end
    end, { "i", "s" }),

    -- Optional: You can map <C-y> as an alternative way to accept the completion
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },  -- LSP source
    { name = 'luasnip' },   -- Snippet source
    { name = 'buffer' },    -- Buffer source
    { name = 'path' },      -- File path source
  })
})



