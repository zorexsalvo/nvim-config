return {
  -- Load on an autocommand event
  { 'andymass/vim-matchup', event = 'VimEnter' },

  -- Treesitter — scoped to languages in use
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
