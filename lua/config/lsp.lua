-- Main LSP Configuration
-- This module sets up nvim-cmp completion and LSP keybindings

-- Load utilities and server configs
local lsp_utils = require('utils.lsp')
local lsp_servers = require('config.lsp-servers')

-- ============================================================================
-- COMPLETION SETUP (nvim-cmp)
-- ============================================================================

local cmp = require('cmp')

-- Main completion setup
cmp.setup({
  sources = {
    { name = "copilot", group_index = 2 },
    { name = 'nvim_lsp', group_index = 2 },
    { name = 'buffer' },
    { name = 'path' },
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
  }),
})

-- Command-line completion
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'cmdline' },
  }),
})

-- ============================================================================
-- LSP SERVER SETUP
-- ============================================================================

local capabilities = lsp_servers.get_capabilities()
lsp_servers.setup_servers(capabilities)
lsp_servers.setup_ruff_autocmd()

-- Enable all configured LSP servers
vim.lsp.enable({ 'ts_ls', 'pyright', 'ruff', 'lua_ls' })

-- ============================================================================
-- UI CONFIGURATION
-- ============================================================================

-- Always show sign column to prevent layout shift
vim.opt.signcolumn = 'yes'

-- ============================================================================
-- LSP KEYBINDINGS
-- ============================================================================

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }
    local buf = vim.lsp.buf

    -- Navigation
    vim.keymap.set('n', 'K', buf.hover, opts)
    vim.keymap.set('n', 'gd', lsp_utils.safe_lsp_jump('textDocument/definition'), opts)
    vim.keymap.set('n', 'gD', lsp_utils.safe_lsp_jump('textDocument/declaration'), opts)
    vim.keymap.set('n', 'gi', lsp_utils.safe_lsp_jump('textDocument/implementation'), opts)
    vim.keymap.set('n', 'go', lsp_utils.safe_lsp_jump('textDocument/typeDefinition'), opts)
    vim.keymap.set('n', 'gr', buf.references, opts)
    vim.keymap.set('n', 'gs', buf.signature_help, opts)

    -- Code actions
    vim.keymap.set('n', '<leader>rn', buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', buf.code_action, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>f', function()
      buf.format({ async = true })
    end, opts)
  end
})

-- ============================================================================
-- DIAGNOSTIC KEYBINDINGS
-- ============================================================================

-- Toggle diagnostic virtual lines
vim.keymap.set('n', 'gK', function()
  vim.diagnostic.config({ virtual_lines = not vim.diagnostic.config().virtual_lines })
end, { desc = 'Toggle diagnostic virtual_lines' })

-- Show all diagnostics in quickfix list
vim.keymap.set('n', '<leader>dq', function()
  vim.diagnostic.setqflist({ open = true })
end, { desc = 'Show all diagnostics in quickfix' })

-- Show diagnostics in location list
vim.keymap.set('n', '<leader>dl', function()
  vim.diagnostic.setloclist({ open = true })
end, { desc = 'Show diagnostics in loclist' })
