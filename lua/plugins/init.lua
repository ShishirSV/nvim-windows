-- lua/plugins/init.lua
-- Basic plugins that don't need complex configuration

return {
	-- Detect tabstop and shiftwidth automatically
	"NMAC427/guess-indent.nvim",
	
	-- Auto pairs for brackets, quotes, etc.
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},

	-- Todo comments highlighting
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
}