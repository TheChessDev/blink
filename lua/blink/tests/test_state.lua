local state = require("blink.state")

describe("marking system", function()
	it("adds and retrieves a mark", function()
		state.add("/tmp/file.lua")
		assert.are.same(state.get_all(), { "/tmp/file.lua" })
	end)
end)
