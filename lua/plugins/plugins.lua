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
}
