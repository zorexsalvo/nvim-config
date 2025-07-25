local cmp = require('cmp')
cmp.setup ({
  sources = {
    { name = "copilot", group_index = 2 },
    { name = 'nvim_lsp', group_index = 2 },
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = true }),         -- Accept selected item
    ['<Tab>'] = cmp.mapping.select_next_item(),                -- Next item
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),              -- Previous item
  },
})

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('lua_ls', {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = {'vim'}, -- Recognize 'vim' as a global variable
      },
      workspace = {
        checkThirdParty = false, -- Disable third-party checks
      },
    },
  },
})

require('lspconfig').pyright.setup {
  capabilities = capabilities,
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        typeCheckingMode = "basic",
        reportUnusedImport = false,
        reportMissingParameterType = false,
        reportMissingReturnType = false,
      },
    },
  },
}

-- Reserve a space in the gutter
vim.opt.signcolumn = 'yes'

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  end,
})

vim.keymap.set('n', 'gK', function()
  local new_config = not vim.diagnostic.config().virtual_lines
  vim.diagnostic.config({ virtual_lines = new_config })
end, { desc = 'Toggle diagnostic virtual_lines' })
