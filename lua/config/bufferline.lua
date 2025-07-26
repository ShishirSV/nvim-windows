-- lua/config/bufferline.lua
-- Bufferline configuration

require("bufferline").setup({
	options = {
		mode = "buffers",
		style_preset = require("bufferline").style_preset.default,
		themable = true,
		numbers = "none",
		close_command = "bdelete! %d",
		right_mouse_command = "bdelete! %d",
		left_mouse_command = "buffer %d",
		middle_mouse_command = nil,
		indicator = {
			icon = "▎",
			style = "icon",
		},
		buffer_close_icon = "󰅖",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 30,
		max_prefix_length = 30,
		truncate_names = true,
		tab_size = 21,
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,
		color_icons = true,
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_close_icon = true,
		show_tab_indicators = true,
		show_duplicate_prefix = true,
		persist_buffer_sort = true,
		move_wraps_at_ends = false,
		separator_style = "slant",
		enforce_regular_tabs = false,
		always_show_bufferline = true,
		hover = {
			enabled = true,
			delay = 200,
			reveal = { "close" },
		},
		sort_by = "insert_after_current",
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "left",
				separator = true,
			},
		},
	},
})

-- Keybindings for buffer navigation
vim.keymap.set("n", "<C-Left>", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<C-Right>", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<A-w>", function()
	local buffers = vim.fn.getbufinfo({ buflisted = 1 })
	if #buffers > 1 then
		vim.cmd("bdelete")
	else
		vim.cmd("enew")
		vim.cmd("bdelete #")
	end
end, { desc = "Close current buffer" })

-- Additional useful keybindings
vim.keymap.set("n", "<leader>bp", ":BufferLinePick<CR>", { desc = "[B]uffer [P]ick" })
vim.keymap.set("n", "<leader>bP", ":BufferLineTogglePin<CR>", { desc = "[B]uffer Toggle [P]in" })
vim.keymap.set("n", "<leader>bD", ":BufferLinePickClose<CR>", { desc = "[B]uffer [D]elete (pick)" })
vim.keymap.set("n", "<leader>bc", ":BufferLineCloseOthers<CR>", { desc = "[B]uffer [C]lose others" })
vim.keymap.set("n", "<leader>bl", ":BufferLineCloseLeft<CR>", { desc = "[B]uffer close [L]eft" })
vim.keymap.set("n", "<leader>br", ":BufferLineCloseRight<CR>", { desc = "[B]uffer close [R]ight" })

-- Move buffers
vim.keymap.set("n", "<leader>bmh", ":BufferLineMovePrev<CR>", { desc = "[B]uffer [M]ove left" })
vim.keymap.set("n", "<leader>bml", ":BufferLineMoveNext<CR>", { desc = "[B]uffer [M]ove right" })

-- Go to specific buffer by number
for i = 1, 9 do
	vim.keymap.set("n", "<leader>" .. i, ":BufferLineGoToBuffer " .. i .. "<CR>", { desc = "Go to buffer " .. i })
end