-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- Theme
		{ "EdenEast/nightfox.nvim" },
		{ "rebelot/kanagawa.nvim" },

		-- Productivity plugins
		{ "tpope/vim-surround" },
		{ "vim-scripts/BufOnly.vim" },
		{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
		{ "kyazdani42/nvim-tree.lua", dependencies = { "kyazdani42/nvim-web-devicons" } },
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			config = function()
				-- use a custom path as the nix-created one is read-only
				local parser_install_dir = vim.fn.stdpath("data") .. "/treesitter"
				vim.opt.runtimepath:append(parser_install_dir)

				require("nvim-treesitter.configs").setup({
					parser_install_dir = parser_install_dir,
					ensure_installed = { "go", "gomod", "python", "rust", "yaml", "hcl", "lua", "clojure" },
					sync_install = false,
					auto_install = true,
					highlight = {
						enable = true,
						additional_vim_regex_highlighting = false,
					},
					-- indent = {
					--     enable = true
					-- },
				})
			end,
		},
		{ "ThePrimeagen/harpoon", dependencies = { "nvim-lua/plenary.nvim" } },

		-- General plugins
		{ "tpope/vim-fugitive" },
		{ "lewis6991/gitsigns.nvim" },
		{ "knsh14/vim-github-link" },
		{ "jiangmiao/auto-pairs" },
		{ "vim-test/vim-test" },
		{ "lukas-reineke/indent-blankline.nvim" },
		{ "andythigpen/nvim-coverage", dependencies = { "nvim-lua/plenary.nvim" } },

		-- LSP and autocomplete plugins
		{
			"VonHeikemen/lsp-zero.nvim",
			dependencies = {
				{ "neovim/nvim-lspconfig" },
				{ "williamboman/mason.nvim" },
				{ "williamboman/mason-lspconfig.nvim" },
				{ "hrsh7th/nvim-cmp" },
				{ "hrsh7th/cmp-buffer" },
				{ "hrsh7th/cmp-path" },
				{ "saadparwaiz1/cmp_luasnip" },
				{ "hrsh7th/cmp-nvim-lsp" },
				{ "hrsh7th/cmp-nvim-lua" },
				{ "hrsh7th/cmp-nvim-lsp-signature-help" },
				{ "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },
				{ "L3MON4D3/LuaSnip" },
				{ "rafamadriz/friendly-snippets" },
			},
		},
		{ "nvimtools/none-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
		{ "zbirenbaum/copilot.lua" },
		{
			"zbirenbaum/copilot-cmp",
			dependencies = { "copilot.lua" },
			config = function()
				require("copilot_cmp").setup()
			end,
		},
		-- {
		-- 	"olimorris/codecompanion.nvim",
		-- 	config = function()
		-- 		require("codecompanion").setup()
		-- 	end,
		-- 	dependencies = {
		-- 		{ "nvim-lua/plenary.nvim" },
		-- 		{ "nvim-treesitter/nvim-treesitter" },
		-- 		-- Optional: Uncomment these to use them
		-- 		-- "stevearc/dressing.nvim",
		-- 		-- "nvim-telescope/telescope.nvim",
		-- 	},
		-- },

		-- Debugging plugins
		{
			"rcarriga/nvim-dap-ui",
			dependencies = {
				{ "mfussenegger/nvim-dap" },
				{ "nvim-neotest/nvim-nio" },
				{ "leoluz/nvim-dap-go" },
			},
		},
		{
			"mxsdev/nvim-dap-vscode-js",
			dependencies = { "mfussenegger/nvim-dap" },
		},

		-- Language-specific plugins
		{
			"ray-x/go.nvim",
			dependencies = { "neovim/nvim-lspconfig", "nvim-treesitter/nvim-treesitter" },
			build = ":GoUpdateBinaries",
		},
		{ "simrat39/rust-tools.nvim" },
	},
	{
		checker = { enabled = true },
	},
})
