-- Git integration plugins
return {
  -- Git signs in gutter
  { 'lewis6991/gitsigns.nvim' },

  -- Git wrapper for Neovim
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Open Fugitive" })
    end
  },
}
