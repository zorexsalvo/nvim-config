-- Editor enhancement plugins
-- Plugins that improve core editing experience
return {
  -- Auto-close brackets, quotes, etc.
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

  -- Surround text objects with quotes, brackets, tags
  {
    "kylechui/nvim-surround",
    version = "*",
    config = function()
      require("nvim-surround").setup({})
    end
  },

  -- Fast navigation with labels
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    config = function()
      require('flash').setup({})
      vim.keymap.set({'n', 'x', 'o'}, '<leader>s', function() require('flash').jump() end)
      vim.keymap.set({'n', 'x', 'o'}, '<leader>S', function() require('flash').treesitter() end)
    end,
  },

  -- File browser in buffer
  {
    'stevearc/oil.nvim',
    config = function()
      require('oil').setup({})
      vim.keymap.set('n', '-', '<cmd>Oil<cr>', { desc = 'Open parent directory' })
    end,
  },

  -- Distraction-free writing mode
  {
    "folke/zen-mode.nvim",
    opts = {},
  },
}
