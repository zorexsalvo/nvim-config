local builtin = require('telescope.builtin')


vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Telescope Find Files" })
vim.keymap.set('n', '<leader>pg', builtin.git_files, { desc = "Telescope Git Files" })
vim.keymap.set('n', '<leader>pl', builtin.live_grep, { desc = "Telescope Live Grep" })
vim.keymap.set('n', '<leader>ps', builtin.grep_string, { desc = "Telescope Grep String" })
