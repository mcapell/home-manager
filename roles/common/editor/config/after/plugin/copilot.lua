require("copilot").setup({
	panel = {
		enabled = true,
		auto_refresh = false,
		keymap = {
			jump_prev = "[[",
			jump_next = "]]",
			accept = "<CR>",
			refresh = "gr",
			open = "<M-CR>",
		},
		layout = {
			position = "bottom", -- | top | left | right
			ratio = 0.4,
		},
	},
	suggestion = {
		enabled = true,
		auto_trigger = true,
		debounce = 75,
		keymap = {
			accept = "<C-l>",
			accept_word = false,
			accept_line = false,
			next = "<M-]>",
			prev = "<M-[>",
			dismiss = "<C-]>",
		},
	},
	filetypes = {
		yaml = false,
		markdown = false,
		help = false,
		gitcommit = false,
		gitrebase = false,
		hgcommit = false,
		svn = false,
		cvs = false,
		["."] = false,
	},
	copilot_node_command = "node", -- Node.js version must be > 16.x
	server_opts_overrides = {},
})

require("copilot.command").disable()
local CopilotStatus = false
function ToggleCopilot()
	if CopilotStatus then
		CopilotStatus = false
		require("copilot.command").disable()
		print("copilot: disabled")
		require("cmp").setup({ completion = { autocomplete = true } })
	else
		CopilotStatus = true
		require("copilot.command").enable()
		require("cmp").setup({ completion = { autocomplete = false } })
		print("copilot: enabled")
	end
end

-- toggle copilot
vim.api.nvim_set_keymap("n", "<leader>cp", ":lua ToggleCopilot()<CR>", { noremap = true, silent = true })
