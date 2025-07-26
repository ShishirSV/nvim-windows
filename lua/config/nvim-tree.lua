-- lua/config/nvim-tree.lua
-- Nvim-tree file explorer configuration

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Custom function to open files in new buffers
local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- Default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- Custom mappings to open files in new buffers
	vim.keymap.set("n", "<CR>", function()
		local node = api.tree.get_node_under_cursor()
		if node and node.type == "file" then
			vim.cmd("badd " .. vim.fn.fnameescape(node.absolute_path))
			vim.cmd("buffer " .. vim.fn.fnameescape(node.absolute_path))
		else
			api.node.open.edit()
		end
	end, opts("Open file in new buffer"))

	vim.keymap.set("n", "o", function()
		local node = api.tree.get_node_under_cursor()
		if node and node.type == "file" then
			vim.cmd("badd " .. vim.fn.fnameescape(node.absolute_path))
			vim.cmd("buffer " .. vim.fn.fnameescape(node.absolute_path))
		else
			api.node.open.edit()
		end
	end, opts("Open file in new buffer"))

	-- Additional useful mappings
	vim.keymap.set("n", "<C-t>", function()
		local node = api.tree.get_node_under_cursor()
		if node and node.type == "file" then
			vim.cmd("tabnew " .. vim.fn.fnameescape(node.absolute_path))
		end
	end, opts("Open file in new tab"))

	vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
	vim.keymap.set("n", "<C-x>", api.node.open.horizontal, opts("Open: Horizontal Split"))
end

require("nvim-tree").setup({
	on_attach = my_on_attach,
	view = {
		width = 30,
		side = "left",
	},
	renderer = {
		icons = {
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
		},
	},
	actions = {
		open_file = {
			quit_on_open = false,
			resize_window = true,
		},
	},
	filters = {
		dotfiles = false,
	},
	tab = {
		sync = {
			open = true,
			close = true,
		},
	},
})

-- Keybindings
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file [E]xplorer" })
vim.keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>", { desc = "[E]xplorer [F]ind current file" })
vim.keymap.set("n", "<leader>ec", ":NvimTreeCollapse<CR>", { desc = "[E]xplorer [C]ollapse all" })