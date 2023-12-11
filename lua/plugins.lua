-- This file can be loaded by calling `lua require('plugins')` from your init.vim
--
--

require 'zorx.remap'
require 'zorx.color'
require 'telescope'
require 'tree'
require 'indentlines'
require 'statusline'

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Simple plugins can be specified as strings
  use 'rstacruz/vim-closer'

  -- Lazy loading:
  -- Load on specific commands
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- Load on an autocommand event
  use {'andymass/vim-matchup', event = 'VimEnter'}

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  use {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }

  -- You can alias plugin names
  use {'dracula/vim', as = 'dracula'}

  -- Experiments
  use {
   'nvim-tree/nvim-tree.lua',
    requires = {
    	'nvim-tree/nvim-web-devicons',
    }
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
     -- or                            , branch = '0.1.x',
     requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  }

  use("theprimeagen/harpoon")
  use("lukas-reineke/indent-blankline.nvim")
  use("preservim/nerdcommenter")

  -- Post-install/update hook with neovim command
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}

end)

