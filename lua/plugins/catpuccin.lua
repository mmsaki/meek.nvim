return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			-- transparent_background = true,
			background = { -- :h background
				light = "latte",
				dark = "mocha",
			},
			color_overrides = {
				mocha = {
					base = "#000000",
					mantle = "#000000",
					crust = "#000000",
				},
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
