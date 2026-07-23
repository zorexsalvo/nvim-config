-- Coding assistance plugins
-- AI completion, TODOs, keybinding hints
return {
  -- GitHub Copilot
  {
    "github/copilot.vim",
    event = "InsertEnter",
    cmd = "Copilot",
  },

  -- Highlight TODO comments
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
  },

  -- Which-key popup for keybindings
  {
    "folke/which-key.nvim",
    opts = {
      delay = 500,
    },
  },
}
