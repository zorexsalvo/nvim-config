return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'master',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { 'python', 'typescript', 'javascript', 'tsx', 'lua' },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
