require("core.mappings")
require("core.plugins")
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets/" })

vim.wo.number = true
vim.wo.signcolumn = "no"

vim.opt.showtabline = 2

vim.opt.tabstop = 2        -- Number of spaces a tab represents
vim.opt.shiftwidth = 2     -- Number of spaces for each indentation level
vim.opt.expandtab = false   -- Convert tabs to spaces if true

vim.opt.list = true
vim.opt.listchars = { tab = '| ' }  -- Pipe followed by a space
