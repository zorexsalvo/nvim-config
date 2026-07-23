-- Navigation plugins
-- File finding, project navigation
return {
  -- Telescope fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    branch = 'master',
    dependencies = { 'nvim-lua/plenary.nvim' },
    extensions = {
      file_browser = { }
    },
    opts = {
      --defaults = require('telescope.themes').get_dropdown(),
    },
  },

  -- Telescope file browser extension
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 
      'nvim-telescope/telescope.nvim', 
      'nvim-lua/plenary.nvim', 
      'nvim-tree/nvim-web-devicons' 
    },
    config = function()
      local builtin = require('telescope.builtin')

      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope Find Files' })
      vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Telescope Git Files' })
      vim.keymap.set('n', '<leader>fn', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>fl',
        function()
          builtin.live_grep({
            additional_args = function()
              return { '--fixed-strings' }
            end
          })
        end,
        { desc = 'Telescope Live Grep' }
      )
      vim.keymap.set('n', '<leader>ps', builtin.grep_string, { desc = 'Telescope Grep String' })
      vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Default vim file browser'} )
      vim.api.nvim_set_keymap(
        'n',
        '<space>fb',
        ':Telescope file_browser path=%:p:h select_buffer=true<CR>',
        { noremap = true }
      )
    end,
  },

  -- Harpoon - quick file marks
  {
    'ThePrimeagen/harpoon',
    dependencies = {'nvim-lua/plenary.nvim'},
    config = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoooon!" })
      vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Open harp tab" })
    end,
  },
}
