-- Syntax highlighting and parsing
-- NOTE: Neovim 0.12.2 has a critical bug in treesitter integration
-- where parsers fail with "attempt to call method 'range' (a nil value)"
-- This affects all buffer highlighting when treesitter is enabled.
-- For now, we disable treesitter completely and use built-in syntax highlighting.

return {
  -- Treesitter - DISABLED due to Neovim 0.12 incompatibility
  {
    'nvim-treesitter/nvim-treesitter',
    enabled = false,  -- Completely disable this plugin
  },
}
