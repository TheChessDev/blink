local M = {}

local state = require("blink.state")

-- Mark the current file
-- @public
-- @returns nil
function M.mark_current_file()
	local filepath = vim.api.nvim_buf_get_name(0)
	state.add(filepath)
end

-- Unmark the current file
-- @public
-- @returns nil
function M.unmark_current_file()
	local filepath = vim.api.nvim_buf_get_name(0)
	state.remove(filepath)
end

-- List all marked files
-- @public
-- @returns table
function M.list_marks()
	return state.get_all()
end

-- Clear all marked files
-- @public
-- @returns nil
function M.clear()
	state.clear()
end

function M.setup()
	return require("blink.ui")
end

return M
