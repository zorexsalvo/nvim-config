require("config.lazy")
require("config.lsp")
require("config.ruff")

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
