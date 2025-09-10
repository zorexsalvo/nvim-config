return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    keys = {
      {
        "<leader>ch",
        function()
          local prev_winnr = vim.api.nvim_get_current_win()
          if vim.fn.mode() == "v" or vim.fn.mode() == "V" or vim.fn.mode() == "\22" then
            vim.cmd([[normal! gv]])
            vim.cmd([[silent '<,'>CopilotChat]])
          else
            vim.cmd("CopilotChat")
          end
          vim.defer_fn(function()
            local chat_win = vim.api.nvim_get_current_win()
            if chat_win ~= prev_winnr then
              vim.cmd("wincmd L")
              vim.cmd("vertical resize " .. math.floor(vim.o.columns * 0.25))
            end
          end, 50)
        end,
        desc = "Open CopilotChat in right panel",
        mode = { "n", "v" },
      },
    },
    opts = {
      setup = function() end,
    },
  },
}
