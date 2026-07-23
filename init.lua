-- Core configuration modules
require("config.lazy")  -- Plugin manager setup
require("config.lsp")   -- LSP and completion setup

-- basic options
vim.opt.number = true
vim.opt.encoding = "utf-8"
vim.opt.list = true
vim.opt.listchars = { tab = ">-", trail = "·" }
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.colorcolumn = "88"

-- filetype-specific settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "html", "htmldjango", "yaml", "yml" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})

vim.wo.relativenumber = true

-- Theme configuration
require('catppuccin').setup({
    transparent_background = true, 
    float = {
        transparent = true,
        solid = false, -- usually set to false for full transparency
    },
})
vim.cmd.colorscheme "catppuccin-frappe"
