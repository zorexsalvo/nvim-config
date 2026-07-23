return {
  -- Load on an autocommand event
  { 'andymass/vim-matchup', event = 'VimEnter' },

  -- Treesitter — scoped to languages in use
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { 'python', 'typescript', 'javascript', 'tsx', 'lua' },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  { 'lewis6991/gitsigns.nvim' },

  {
    "folke/zen-mode.nvim",
    opts = {},
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    config = function()
      require("nvim-surround").setup({})
    end
  },

  { "nvim-tree/nvim-web-devicons", lazy = true },

  { "neovim/nvim-lspconfig" },

  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('nvim-autopairs').setup({})
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },

  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    config = function()
      require('flash').setup({})
      vim.keymap.set({'n', 'x', 'o'}, 's', function() require('flash').jump() end)
      vim.keymap.set({'n', 'x', 'o'}, 'S', function() require('flash').treesitter() end)
    end,
  },

  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
  },

  {
    'j-hui/fidget.nvim',
    opts = {},
  },

  {
    'stevearc/oil.nvim',
    config = function()
      require('oil').setup({})
      vim.keymap.set('n', '-', '<cmd>Oil<cr>', { desc = 'Open parent directory' })
    end,
  },
}
