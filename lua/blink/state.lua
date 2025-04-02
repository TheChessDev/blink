--- @module state
--- @author julian
--- @license MIT
local M = {}

local marks = {}

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
	for i, mark in ipairs(marks) do
		if mark == filepath then
			table.remove(marks, i)
			break
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
end

return M
