local cmp = require('cmp')
cmp.setup({
  sources = {
    { name = "copilot", group_index = 2 },
    { name = 'nvim_lsp', group_index = 2 },
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
  }),
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

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

vim.lsp.config("pyright", {
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
})

vim.lsp.config("ruff", {
  capabilities = capabilities,
  init_options = {
    settings = {
      args = {},
    }
  }
})

vim.opt.signcolumn = 'yes'

local function safe_lsp_jump(method)
  return function()
    local params = vim.lsp.util.make_position_params()
    vim.lsp.buf_request(0, method, params, function(err, result, ctx, config)
      if err then
        vim.notify("LSP error: " .. tostring(err.message), vim.log.levels.ERROR)
        return
      end
      if not result or vim.tbl_isempty(result) then
        vim.notify("No locations found", vim.log.levels.INFO)
        return
      end
      
      local handler = vim.lsp.handlers[method]
      if handler then
        handler(err, result, ctx, config)
      else
        -- Fallback to default jump-to-location behavior
        if vim.islist(result) then
          vim.lsp.util.jump_to_location(result[1], 'utf-8')
        else
          vim.lsp.util.jump_to_location(result, 'utf-8')
        end
      end
    end)
  end
end

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }
    local buf = vim.lsp.buf

    vim.keymap.set('n', 'K', buf.hover, opts)
    vim.keymap.set('n', 'gd', safe_lsp_jump('textDocument/definition'), opts)
    vim.keymap.set('n', 'gD', safe_lsp_jump('textDocument/declaration'), opts)
    vim.keymap.set('n', 'gi', safe_lsp_jump('textDocument/implementation'), opts)
    vim.keymap.set('n', 'go', safe_lsp_jump('textDocument/typeDefinition'), opts)
    vim.keymap.set('n', 'gr', buf.references, opts)
    vim.keymap.set('n', 'gs', buf.signature_help, opts)
    vim.keymap.set('n', '<leader>rn', buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', buf.code_action, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>f', function()
      buf.format({ async = true })
    end, opts)
  end
})

vim.keymap.set('n', 'gK', function()
  vim.diagnostic.config({ virtual_lines = not vim.diagnostic.config().virtual_lines })
end, { desc = 'Toggle diagnostic virtual_lines' })

vim.keymap.set('n', '<leader>dq', function()
  vim.diagnostic.setqflist({ open = true })
end, { desc = 'Show all diagnostics in quickfix' })

vim.keymap.set('n', '<leader>dl', function()
  vim.diagnostic.setloclist({ open = true })
end, { desc = 'Show diagnostics in loclist' })

vim.lsp.config('html', { capabilities = capabilities })
vim.lsp.config('ts_ls', { capabilities = capabilities })
vim.lsp.config('emmet_ls', { capabilities = capabilities })
vim.lsp.config('cssls', { capabilities = capabilities })

vim.lsp.enable({ 'html', 'ts_ls', 'pyright', 'ruff', 'emmet_ls', 'cssls', 'lua_ls' })
