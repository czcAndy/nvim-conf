return {
	"karb94/neoscroll.nvim",
	config = function()
		local neoscroll = require("neoscroll")

		neoscroll.setup({})

		local keymap = {
			-- Use the "sine" easing function
			["<C-u>"] = function()
				neoscroll.ctrl_u({ duration = 250, easing = "sine" })
			end,
			["<C-d>"] = function()
				neoscroll.ctrl_d({ duration = 250, easing = "sine" })
			end,
			-- When no value is passed the `easing` option supplied in `setup()` is used
			["<C-y>"] = function()
				neoscroll.scroll(-0.1, { move_cursor = false, duration = 250, easing = "sine" })
			end,
			["<C-s>"] = function()
				neoscroll.scroll(0.1, { move_cursor = false, duration = 250, easing = "sine" })
			end,
		}
		local modes = { "n", "v", "x" }
		for key, func in pairs(keymap) do
			vim.keymap.set(modes, key, func)
		end
	end,
}
