local tree = require "nvim-tree.api"

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "?", tree.tree.toggle_help)
vim.keymap.set("n", "<C-h>", ":NvimTreeToggle<cr>", { silent = true, noremap = true })
