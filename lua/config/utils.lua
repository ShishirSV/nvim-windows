-- lua/config/utils.lua
-- Utility functions used across the configuration

local M = {}

-- Smart buffer close function (if you decide to add it back later)
function M.smart_close_buffer()
	local current_buf = vim.api.nvim_get_current_buf()
	local alternate_buf = vim.fn.bufnr("#")
	local all_buffers = vim.fn.getbufinfo({ buflisted = 1 })

	-- Count valid buffers (excluding special buffers like nvim-tree)
	local valid_buffers = {}
	for _, buf in ipairs(all_buffers) do
		local readonly = vim.bo[buf.bufnr].readonly
		local buftype = vim.bo[buf.bufnr].buftype

		if buf.name ~= "" and not readonly and buftype == "" then
			table.insert(valid_buffers, buf.bufnr)
		end
	end

	-- If this is the last buffer, close all buffers (will exit if no other windows)
	if #valid_buffers <= 1 then
		vim.cmd("qa")
	-- Check if alternate buffer exists and is valid
	elseif alternate_buf ~= -1 and alternate_buf ~= current_buf and vim.api.nvim_buf_is_valid(alternate_buf) then
		-- Switch to alternate buffer first, then delete the original
		vim.cmd("buffer " .. alternate_buf)
		vim.cmd("bdelete " .. current_buf)
	else
		-- No valid previous buffer, just close normally
		vim.cmd("bdelete")
	end
end

return M