-- LSP server-specific configurations
-- Each server is configured with capabilities and custom settings
local M = {}

--- Get default LSP capabilities with nvim-cmp integration
--- @return table capabilities
function M.get_capabilities()
  return require('cmp_nvim_lsp').default_capabilities()
end

--- Configure all LSP servers
--- @param capabilities table LSP capabilities from get_capabilities()
function M.setup_servers(capabilities)
  -- Lua LSP
  vim.lsp.config('lua_ls', {
    capabilities = capabilities,
    settings = {
      Lua = {
        diagnostics = {
          globals = {'vim'},
        },
        workspace = {
          checkThirdParty = false,
        },
      },
    },
  })

  -- Python LSP (Pyright)
  vim.lsp.config("pyright", {
    capabilities = capabilities,
    settings = {
      pyright = {
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

  -- Python Linter/Formatter (Ruff)
  vim.lsp.config("ruff", {
    capabilities = capabilities,
    init_options = {
      settings = {
        args = {},
      }
    }
  })

  -- TypeScript/JavaScript LSP
  vim.lsp.config('ts_ls', { 
    capabilities = capabilities 
  })
end

--- Setup Ruff-specific behavior (disable hover in favor of Pyright)
function M.setup_ruff_autocmd()
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client == nil then
        return
      end
      if client.name == 'ruff' then
        -- Disable hover in favor of Pyright
        client.server_capabilities.hoverProvider = false
      end
    end,
    desc = 'LSP: Disable hover capability from Ruff',
  })
end

return M
