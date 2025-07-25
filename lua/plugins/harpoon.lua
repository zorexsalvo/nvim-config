return {
  'ThePrimeagen/harpoon',
  requires = {'nvim-lua/plenary.nvim'},
  config = function()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoooon!" } )
    vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Open harp tab" } )
  end,
}
