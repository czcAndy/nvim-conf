return {
	"luftaquila/nvim-cursorline",
	config = function()
		require("nvim-cursorline").setup({
			cursorline = {
				enable = true,
				timeout = 250,
				number = true,
			},
		})
	end,
}
