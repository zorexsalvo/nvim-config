-- UI and appearance plugins
-- Status line, notifications, visual enhancements
return {
  -- Icon support for plugins
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- Status line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = "auto",
          section_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" },
          always_divide_middle = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = {
            { "filename", path = 1 },
            {
              function()
                local msg = 'No Active LSP'
                local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
                if next(buf_clients) == nil then
                  return msg
                end
                local client_names = {}
                for _, client in ipairs(buf_clients) do
                  table.insert(client_names, client.name)
                end
                return "  LSP: " .. table.concat(client_names, ", ")
              end,
              color = { fg = "#6cb6eb", gui = "bold" },
              icon = ' ',
            },
          },
          lualine_x = { "filetype", "encoding", "fileformat" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = {},
      })
    end
  },

  -- LSP progress notifications
  {
    'j-hui/fidget.nvim',
    opts = {},
  },

  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },

  -- Markdown rendering (disabled - causes treesitter issues in nvim 0.12)
  -- {
  --   'MeanderingProgrammer/render-markdown.nvim',
  --   dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  --   ft = { 'markdown' },
  --   opts = {
  --     enabled = false,
  --   },
  -- },
}
