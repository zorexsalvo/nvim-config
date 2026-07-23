-- LSP and completion plugins
-- Core LSP support and nvim-cmp completion sources
return {
  -- LSP configuration
  { "neovim/nvim-lspconfig" },

  -- Completion engine
  { 'hrsh7th/nvim-cmp' },
  
  -- Completion sources
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },
}
