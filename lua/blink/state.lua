--- @module state
--- @author julian
--- @license MIT
local M = {}

local marks = {}
local current_index = nil

--- Add a mark for the given filepath.
--- @param filepath string The filepath to add a mark for.
--- @return nil
function M.add(filepath)
	if not vim.tbl_contains(marks, filepath) then
		table.insert(marks, filepath)
	end
end

--- Remove a mark for the given filepath.
--- @param filepath string The filepath to add a mark for.
--- @return nil
function M.remove(filepath)
	for i, path in ipairs(marks) do
		if path == filepath then
			table.remove(marks, i)
			if current_index and current_index > i then
				current_index = current_index - 1
			elseif current_index == #marks + 1 then
				current_index = 1
			end
		end
	end
end

--- Get all marks.
--- @return table
function M.get_all()
	return vim.tbl_extend("force", {}, marks)
end

--- Clear all marks.
--- @return nil
function M.clear()
	marks = {}
	current_index = nil
end

--- Jump to the next mark.
--- @return nil
function M.jump_next()
	if #marks == 0 then
		return
	end
	if not current_index then
		current_index = 1
	else
		current_index = current_index % #marks + 1
	end
	vim.cmd("edit " .. marks[current_index])
end

--- Jump to the previous mark.
--- @return nil
function M.jump_prev()
	if #marks == 0 then
		return
	end
	if not current_index then
		current_index = #marks
	else
		current_index = (current_index - 2 + #marks) % #marks + 1
	end
	local target = marks[current_index]
	if vim.api.nvim_buf_get_name(0) ~= target then
		vim.cmd("edit " .. target)
	end
end

return M
