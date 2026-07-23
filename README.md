# Neovim Configuration

This is my personal Neovim configuration, designed for productivity and clean code organization.

## Features

- **LSP Support** - Language servers for Python, TypeScript/JavaScript, Lua
- **Completion** - nvim-cmp with LSP, buffer, path, and Copilot sources
- **Fuzzy Finding** - Telescope for files, buffers, and live grep
- **Git Integration** - Fugitive and Gitsigns for git operations
- **Syntax Highlighting** - Treesitter for enhanced parsing
- **Navigation** - Harpoon for quick marks, Flash for labeled jumps
- **UI Enhancements** - Lualine status line, indent guides, fidget notifications
- **Code Assistance** - GitHub Copilot, TODO highlighting, which-key hints

## Structure

```
.
├── init.lua                  # Entry point, basic vim options
├── lua/
│   ├── config/              # Core configuration modules
│   │   ├── README.md        # Configuration documentation
│   │   ├── lazy.lua         # Plugin manager setup
│   │   ├── lsp.lua          # LSP and completion setup
│   │   └── lsp-servers.lua  # Per-server LSP configs
│   ├── plugins/             # Plugin specifications (lazy.nvim)
│   │   ├── coding.lua       # Copilot, TODOs, which-key
│   │   ├── colorscheme.lua  # Catppuccin theme
│   │   ├── completion.lua   # nvim-cmp and sources
│   │   ├── editor.lua       # Autopairs, surround, flash, oil
│   │   ├── git.lua          # Fugitive, gitsigns
│   │   ├── navigation.lua   # Telescope, harpoon
│   │   ├── syntax.lua       # Treesitter
│   │   └── ui.lua           # Lualine, fidget, indent guides
│   └── utils/               # Utility functions
│       └── lsp.lua          # LSP helper functions
└── docs/                    # Documentation
```

## Requirements

- Neovim >= 0.10 (tested on 0.12.2)
- Git
- A patched font for icons (e.g., Nerd Font)
- Language servers:
  - `lua-language-server` for Lua
  - `pyright` and `ruff` for Python
  - `typescript-language-server` for TypeScript/JavaScript

## Installation

1. Clone this repo to `~/.config/nvim`
2. Start Neovim - lazy.nvim will auto-install on first run
3. Install language servers (via Mason, npm, pip, etc.)

## Key Bindings

### General
- `<leader>` = `<space>`
- `<leader>mp` - Toggle markdown preview

### LSP
- `K` - Hover documentation
- `gd` - Go to definition
- `gD` - Go to declaration
- `gi` - Go to implementation
- `go` - Go to type definition
- `gr` - Find references
- `gs` - Signature help
- `<leader>rn` - Rename symbol
- `<leader>ca` - Code action
- `<leader>f` - Format buffer

### Diagnostics
- `gK` - Toggle diagnostic virtual lines
- `<leader>dq` - Show all diagnostics in quickfix
- `<leader>dl` - Show diagnostics in location list

### Navigation
- `<leader>ff` - Find files (Telescope)
- `<leader>fg` - Find git files (Telescope)
- `<leader>fn` - Find buffers (Telescope)
- `<leader>fl` - Live grep (Telescope)
- `<leader>ps` - Grep string under cursor
- `<space>fb` - File browser (Telescope)
- `<leader>a` - Add file to Harpoon
- `<C-e>` - Toggle Harpoon menu
- `<leader>s` - Flash jump
- `<leader>S` - Flash treesitter
- `-` - Open parent directory (Oil)

### Git
- `<leader>gs` - Open Fugitive

## Customization

- Edit `init.lua` for basic vim options and theme
- Add plugins in `lua/plugins/` (files are auto-loaded)
- Modify LSP servers in `lua/config/lsp-servers.lua`
- Adjust keybindings in respective plugin or config files

## Troubleshooting

If you encounter errors:

1. Check Neovim version: `nvim --version` (must be >= 0.10)
2. Run `:checkhealth` in Neovim
3. Ensure language servers are installed
4. Check `lua/config/README.md` for module documentation
