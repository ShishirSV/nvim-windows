-- init.lua - Main entry point for Neovim configuration

-- Set leader keys before loading plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

-- Load configuration modules
require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.lazy")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et