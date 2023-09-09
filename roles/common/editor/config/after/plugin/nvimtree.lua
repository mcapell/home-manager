-- File manager
require("nvim-tree").setup({
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
})

---- NvimTree
vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<CR>")
vim.keymap.set("n", "<leader>p", ":NvimTreeToggle<CR>")
