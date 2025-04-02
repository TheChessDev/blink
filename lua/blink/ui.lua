local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local config = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local state = require("blink.state")

local M = {}

function M.open()
	pickers
		.new({}, {
			prompt_title = "Blink Marks",
			finder = finders.new_table({
				results = state.get_all(),
			}),
			sorter = config.generic_sorter({}),
			attach_mappings = function(_, _)
				actions.select_default:replace(function()
					actions.close()
					local selection = action_state.get_selected_entry()
					if selection then
						vim.cmd("edit " .. selection.value)
					end
				end)
				return true
			end,
		})
		:find()
end

return {
	open = M.open,
}
