return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    requires = { {'nvim-lua/plenary.nvim'} },
    extensions = {
      file_browser = { }
    }
  },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Telescope Find Files" })
      vim.keymap.set('n', '<leader>pg', builtin.git_files, { desc = "Telescope Git Files" })
      vim.keymap.set('n', '<leader>pl', builtin.live_grep, { desc = "Telescope Live Grep" })
      vim.keymap.set('n', '<leader>ps', builtin.grep_string, { desc = "Telescope Grep String" })
      vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Default vim file browser"} )
      vim.api.nvim_set_keymap(
        "n",
        "<space>fb",
        ":Telescope file_browser<CR>",
        { noremap = true }
      )
      -- open file_browser with the path of the current buffer
      vim.api.nvim_set_keymap(
        "n",
        "<space>fb",
        ":Telescope file_browser path=%:p:h select_buffer=true<CR>",

        { noremap = true }
      )
    end,
  },
}


