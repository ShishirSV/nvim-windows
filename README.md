# Modular Neovim Configuration

This is a modular Neovim configuration based on Kickstart.nvim, organized for better maintainability and customization.

## Directory Structure

```
~/.config/nvim/
├── init.lua                    # Main entry point
├── lua/
│   ├── config/
│   │   ├── options.lua         # Neovim options and settings
│   │   ├── keymaps.lua         # Global keymaps
│   │   ├── autocmds.lua        # Autocommands
│   │   ├── lazy.lua            # Lazy.nvim setup
│   │   ├── nvim-tree.lua       # File explorer configuration
│   │   ├── bufferline.lua      # Buffer line configuration
│   │   ├── toggleterm.lua      # Terminal configuration
│   │   ├── mini.lua            # Mini.nvim configuration
│   │   ├── lsp.lua             # LSP configuration
│   │   └── utils.lua           # Utility functions
│   └── plugins/
│       ├── init.lua            # Basic plugins
│       ├── ui.lua              # UI and visual plugins
│       ├── colorscheme.lua     # Colorscheme configuration
│       ├── telescope.lua       # Fuzzy finder
│       ├── lsp.lua             # LSP plugins
│       ├── treesitter.lua      # Syntax highlighting
│       └── git.lua             # Git integration
└── README.md                   # This file
```

## Key Features

### Core Functionality
- **File Explorer**: nvim-tree with custom keybindings
- **Fuzzy Finding**: Telescope with multiple search modes
- **Buffer Management**: Bufferline with VS Code-like navigation
- **Terminal Integration**: ToggleTerm with multiple terminal support
- **LSP Support**: Full Language Server Protocol support with Mason
- **Autocompletion**: Blink.cmp with snippet support
- **Syntax Highlighting**: Treesitter for modern syntax highlighting

### Language Support
- **C/C++**: clangd with WSL support and C++23 standard
- **Lua**: lua_ls with Neovim API support
- **Python**: pyright
- **Rust**: rust_analyzer
- **Go**: gopls
- **Java**: jdtls

### Key Bindings

#### Leader Key: `<Space>`

#### File Management
- `<leader>e` - Toggle file explorer
- `<leader>ef` - Find current file in explorer
- `<leader>ec` - Collapse all explorer folders

#### Search (Telescope)
- `<leader>sf` - Search files
- `<leader>sg` - Live grep
- `<leader>sw` - Search current word
- `<leader>sh` - Search home directory
- `<leader>sc` - Search C: drive
- `<leader>sp` - Search project root
- `<leader>sd` - Search desktop
- `<leader>sn` - Search Neovim config files

#### Buffer Management
- `<C-Left>` / `<C-Right>` - Navigate between buffers
- `<A-w>` - Close current buffer
- `<leader>1-9` - Go to specific buffer
- `<leader>bp` - Pick buffer
- `<leader>bc` - Close other buffers

#### Terminal
- `<C-`>` - Toggle terminal
- `<leader>tt` - Toggle terminal
- `<leader>t1-4` - Open specific terminal
- `<leader>tf` - Floating terminal
- `<leader>tv` - Vertical terminal

#### LSP
- `grd` - Go to definition
- `grr` - Go to references
- `grn` - Rename symbol
- `gra` - Code actions
- `gri` - Go to implementation
- `grt` - Go to type definition

#### General
- `<C-s>` - Save file
- `<C-S-s>` - Save as
- `<Esc>` - Clear search highlights

## Customization

### Adding New Plugins
1. Create a new file in `lua/plugins/` or add to existing files
2. Follow the lazy.nvim plugin specification format
3. Add configuration files in `lua/config/` if needed

### Modifying Settings
- **Options**: Edit `lua/config/options.lua`
- **Keymaps**: Edit `lua/config/keymaps.lua` for global keymaps
- **Plugin-specific**: Edit the corresponding file in `lua/config/`

### Changing Colorscheme
Edit `lua/plugins/colorscheme.lua` to switch between themes or add new ones.

### LSP Configuration
- **Add servers**: Edit the `servers` table in `lua/config/lsp.lua`
- **Modify settings**: Update server-specific configuration in the same file

## Installation

1. Backup your existing Neovim configuration
2. Clone or copy these files to `~/.config/nvim/`
3. Start Neovim - plugins will be automatically installed
4. Run `:checkhealth` to verify everything is working

## Dependencies

- **Neovim >= 0.10**
- **Git**
- **Make** (for some plugins)
- **WSL** (if using C/C++ on Windows)
- **Nerd Font** (recommended for icons)

## Notes

- This configuration is based on Kickstart.nvim
- Uses Gruvbox as the default colorscheme
- Configured for C/C++ development with WSL support
- Includes friendly-snippets for autocompletion
- Uses Mason for automatic LSP installation