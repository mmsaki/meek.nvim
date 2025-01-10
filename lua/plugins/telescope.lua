return {
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	lazy = false,
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		-- local telescope
		local builtin = require("telescope.builtin")
	end,
	keys = {
		vim.keymap.set('n', '<leader>ff', ":Telescope find_files<CR>", {}),
		vim.keymap.set('n', '<leader>fg', ":Telescope live_grep<CR>", {}),
		vim.keymap.set('n', '<leader>fb', ":Telescope buffers<CR>", {}),
		vim.keymap.set('n', '<leader>fh', ":Telescope help_tags<CR>", {}),
	}
}
