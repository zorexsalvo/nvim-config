return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').install({
        'python', 'typescript', 'javascript', 'tsx', 'lua', 'markdown', 'markdown_inline',
      })
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'python', 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'lua', 'markdown' },
        callback = function(event)
          vim.treesitter.start(event.buf)
          vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
