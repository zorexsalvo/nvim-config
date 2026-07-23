-- LSP utility functions
local M = {}

--- Safely jump to LSP location with error handling
--- @param method string LSP method name (e.g., 'textDocument/definition')
--- @return function Handler function for vim.keymap.set
function M.safe_lsp_jump(method)
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
        if vim.islist(result) then
          vim.lsp.util.jump_to_location(result[1], 'utf-8')
        else
          vim.lsp.util.jump_to_location(result, 'utf-8')
        end
      end
    end)
  end
end

return M
