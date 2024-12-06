local lsp = require('lsp-zero').preset({
    manage_nvim_cmp = true, -- Enable cmp management by lsp-zero
    set_lsp_keymaps = true, -- Default keymaps
    suggest_lsp_servers = true, -- Automatically suggest servers
})

-- Ensure Python LSP is installed
lsp.ensure_installed({
    'pyright', -- or pylsp, depending on your preference
})

-- Configure CMP for Autocompletion
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

-- On Attach Callback for Additional Configurations
lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
end)

-- Finalize Setup
lsp.setup()

