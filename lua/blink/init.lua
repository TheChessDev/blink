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

-- Jump to the next marked file
-- @public
-- @returns nil
function M.blink_back()
	state.jump_prev()
end

-- Jump to the previous marked file
-- @public
-- @returns nil
function M.blink_forward()
	state.jump_next()
end

function M.setup()
	return require("blink.ui")
end

return M
