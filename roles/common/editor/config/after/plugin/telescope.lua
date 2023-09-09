require("telescope").setup({
	defaults = {
		file_ignore_patterns = { ".git/", "vendor/" },
		mappings = {
			n = {
				["dd"] = require("telescope.actions").delete_buffer,
			},
		},
	},
	pickers = {
		find_files = {
			hidden = true,
		},
	},
})

---- Telescope
vim.keymap.set("n", "<C-p>", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>k", ":Telescope grep_string<CR>")
vim.keymap.set("n", "<leader>a", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>cd", ":Telescope diagnostics<CR>")
