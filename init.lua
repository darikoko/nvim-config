require("core.mappings")
require("core.plugins")
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets/" })

vim.wo.number = true
vim.wo.signcolumn = "no"

vim.opt.showtabline = 2

vim.opt.list = true
vim.opt.listchars = { tab = '>~' }
