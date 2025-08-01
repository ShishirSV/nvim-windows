-- lua/config/toggleterm.lua
-- ToggleTerm terminal configuration

-- Detect PowerShell for Windows
local shell
if vim.fn.has("win32") == 1 then
	if vim.fn.executable("pwsh") == 1 then
		shell = "pwsh"
	elseif vim.fn.executable("powershell") == 1 then
		shell = "powershell.exe"
	else
		shell = "cmd.exe"
	end
else
	shell = vim.o.shell
end

require("toggleterm").setup({
	size = 15,
	open_mapping = [[<C-`>]],
	hide_numbers = true,
	shade_terminals = false,
	start_in_insert = true,
	insert_mappings = true,
	terminal_mappings = true,
	persist_size = true,
	persist_mode = true,
	direction = "horizontal",
	close_on_exit = true,
	shell = shell,
	auto_scroll = true,
	winbar = {
		enabled = false,
	},
})

-- Keymaps for multiple terminals
vim.keymap.set("n", "<leader>tt", ":ToggleTerm<CR>", { desc = "Toggle terminal" })
vim.keymap.set("n", "<leader>t1", ":1ToggleTerm<CR>", { desc = "[T]erminal [1]" })
vim.keymap.set("n", "<leader>t2", ":2ToggleTerm<CR>", { desc = "[T]erminal [2]" })
vim.keymap.set("n", "<leader>t3", ":3ToggleTerm<CR>", { desc = "[T]erminal [3]" })
vim.keymap.set("n", "<leader>t4", ":4ToggleTerm<CR>", { desc = "[T]erminal [4]" })

-- Close all terminals at once
vim.keymap.set("n", "<leader>tc", ":ToggleTermToggleAll<CR>", { desc = "[T]erminal [C]lose all" })

-- Different layouts
vim.keymap.set("n", "<leader>tf", ":ToggleTerm direction=float<CR>", { desc = "[T]erminal [F]loating" })
vim.keymap.set("n", "<leader>tv", ":ToggleTerm direction=vertical size=80<CR>", { desc = "[T]erminal [V]ertical" })

-- Lazygit integration with toggleterm
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	hidden = true,
	direction = "float",
	float_opts = {
		border = "double",
	},
})

vim.keymap.set("n", "<leader>gg", function()
	lazygit:toggle()
end, { desc = "Toggle Lazygit (floating)" })

