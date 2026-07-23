# Neovim Configuration Modules

This directory contains core configuration modules loaded by `init.lua`.

## Module Loading Order

1. **lazy.nvim** (`lazy.lua`) - Plugin manager bootstrap and setup
2. **LSP Configuration** (`lsp.lua`) - Language Server Protocol setup

The order matters: lazy.nvim must load first to make plugins available.

## Module Descriptions

### `lazy.lua`
Bootstrap and configure the lazy.nvim plugin manager. Sets up:
- Plugin manager installation (auto-clones if missing)
- Leader keys (`<space>` and `\`)
- Plugin spec import from `lua/plugins/`

### `lsp.lua`
Main LSP configuration module. Sets up:
- nvim-cmp completion (insert mode and command-line)
- LSP servers via `lsp-servers.lua`
- LSP keybindings (gd, gr, K, etc.)
- Diagnostic configuration and keybindings

### `lsp-servers.lua`
Per-server LSP configurations. Defines settings for:
- **lua_ls** - Lua language server (vim globals, workspace config)
- **pyright** - Python type checker (basic mode, disabled organize imports)
- **ruff** - Python linter/formatter (hover disabled in favor of Pyright)
- **ts_ls** - TypeScript/JavaScript language server

## Dependencies

- `lsp.lua` depends on:
  - `lsp-servers.lua` (server configurations)
  - `utils/lsp.lua` (utility functions)
  - Plugins from `plugins/completion.lua` (nvim-cmp, cmp sources)

## Adding New LSP Servers

1. Add server config to `lsp-servers.lua` in `setup_servers()` function
2. Add server name to `vim.lsp.enable()` call in `lsp.lua`
3. Install the language server binary (via Mason, npm, pip, etc.)
