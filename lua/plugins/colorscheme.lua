-- Set this to "catppuccin" or "tokyodark" to choose the active theme.
local colorscheme = "tokyodark"

return {
  {
    "tiagovla/tokyodark.nvim",
    lazy = colorscheme ~= "tokyodark",
    priority = 1000,
    config = function()
      if colorscheme == "tokyodark" then
        vim.cmd.colorscheme("tokyodark")
      end
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = colorscheme ~= "catppuccin",
    priority = 1000,
    config = function()
      if colorscheme == "catppuccin" then
        require("catppuccin").setup({
          transparent_background = false,
          float = { transparent = false },
        })
        vim.cmd.colorscheme("catppuccin-mocha")
      end
    end,
  },
}
