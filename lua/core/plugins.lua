local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
   use {
  'nvim-telescope/telescope.nvim', tag = '0.1.4',
  requires = { {'nvim-lua/plenary.nvim'} }
}

use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})

use({
  "nvim-treesitter/nvim-treesitter-textobjects",
  after = "nvim-treesitter",
  requires = "nvim-treesitter/nvim-treesitter",
})

 -- LSP configuration
  use 'neovim/nvim-lspconfig'

  -- Autocompletion
  use {
    'hrsh7th/nvim-cmp',        -- Autocompletion plugin
    'hrsh7th/cmp-nvim-lsp',    -- LSP source for nvim-cmp
    'hrsh7th/cmp-buffer',      -- Buffer source for nvim-cmp
    'hrsh7th/cmp-path',        -- Path source for nvim-cmp
    'saadparwaiz1/cmp_luasnip' -- LuaSnip source for nvim-cmp
  }

  -- Snippet engine
  use 'L3MON4D3/LuaSnip'        -- Snippet engine
  use 'rafamadriz/friendly-snippets' -- Collection of snippets


use {
"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
}
use "rebelot/kanagawa.nvim"
use { 'EdenEast/nightfox.nvim' }
use 'tamton-aquib/staline.nvim'
use 'folke/tokyonight.nvim'
use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional
  },
}

-- Add vim-bundle-mako
use {
    'sophacles/vim-bundle-mako',
    ft = 'mako'  -- Load only when editing mako files
}

-- Emmet Support
use {
  "olrtg/nvim-emmet",
  config = function()
    vim.keymap.set({ "n", "v" }, '<leader>xe', require('nvim-emmet').wrap_with_abbreviation)
  end,
}

-- Smooth Scrolling
use 'karb94/neoscroll.nvim'


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
