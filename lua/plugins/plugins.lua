return {
  -- Lazy loading:
  -- Load on specific commands
  { 'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}},

  -- Load on an autocommand event
  { 'andymass/vim-matchup', event = 'VimEnter' },

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  },

  { "preservim/nerdcommenter" },

  -- Post-install/update hook with neovim command
  { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },

  --{ 'lewis6991/gitsigns.nvim' },

  {
    "folke/zen-mode.nvim",
    opts = { },
  },

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

  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      local ls = require("luasnip")

      vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
      vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
      vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

      vim.keymap.set({"i", "s"}, "<C-E>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, {silent = true})
    end
  },

  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
}
