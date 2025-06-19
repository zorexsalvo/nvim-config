return {
   { 'rstacruz/vim-closer' },

  -- Lazy loading:
  -- Load on specific commands
  { 'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}},

  -- Load on an autocommand event
  { 'andymass/vim-matchup', event = 'VimEnter', lazy = true },

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  },

  { "preservim/nerdcommenter", lazy = True },

  -- Post-install/update hook with neovim command
  { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', lazy = True },

  { 'lewis6991/gitsigns.nvim', lazy = True },

  {
      "folke/zen-mode.nvim",
      opts = { },
  },

  {
        "lukas-reineke/headlines.nvim",
        after = "nvim-treesitter",
        config = function()
            require("headlines").setup()
        end,
  },

  { 'folke/which-key.nvim' },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },

  { "nvim-tree/nvim-web-devicons", lazy = true },

  { "neovim/nvim-lspconfig" },
}

