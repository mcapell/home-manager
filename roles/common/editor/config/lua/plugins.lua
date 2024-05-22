local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

local is_boostrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_boostrap = true
	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	vim.cmd([[packadd packer.nvim]])
end

return require("packer").startup(function()
	use("wbthomason/packer.nvim")

	-- Theme
	use("EdenEast/nightfox.nvim")

	-- Productivity
	use("tpope/vim-surround")
	use("vim-scripts/BufOnly.vim")
	use({
		"nvim-telescope/telescope.nvim",
		requires = "nvim-lua/plenary.nvim",
	})
	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use({
		"ThePrimeagen/harpoon",
		requires = "nvim-lua/plenary.nvim",
	})

	-- General
	use("tpope/vim-fugitive")
	use("lewis6991/gitsigns.nvim")
	use("knsh14/vim-github-link")
	-- use("editorconfig/editorconfig-vim")
	use("jiangmiao/auto-pairs")
	use("vim-test/vim-test")
	use("lukas-reineke/indent-blankline.nvim")
	use({
		"andythigpen/nvim-coverage",
		requires = "nvim-lua/plenary.nvim",
	})

	-- LSP and autocomplete
	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },
			{ "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})
	use({
		"nvimtools/none-ls.nvim",
		requires = "nvim-lua/plenary.nvim",
	})
	use({ "zbirenbaum/copilot.lua" })
	use({
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	})

	-- Debug
	use({
		"rcarriga/nvim-dap-ui",
		requires = {
			{ "mfussenegger/nvim-dap" },
			{ "nvim-neotest/nvim-nio" },

			-- Languages
			{ "leoluz/nvim-dap-go" },
		},
	})
	use("mxsdev/nvim-dap-vscode-js", {
		requires = {
			{ "mfussenegger/nvim-dap" },
		},
	})

	-- Go
	use("ray-x/go.nvim", {
		requires = {
			{ "neovim/nvim-lspconfig" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		run = ":GoUpdateBinaries",
	})

	-- Rust
	use("simrat39/rust-tools.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if is_bootstrap then
		require("packer").sync()
	end
end)
