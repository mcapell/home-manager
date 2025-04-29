local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(_, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })

	local opts = { buffer = bufnr, remap = false }
	-- LSP Commands
	vim.keymap.set("n", "gs", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set({ "n", "v" }, "<leader>rr", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("n", "<leader>p", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>n", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set({ "n", "v" }, "<leader>ca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>ce", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "<leader>cf", function()
		vim.lsp.buf.format()
	end, opts)
	vim.keymap.set("n", "gi", ":Telescope lsp_implementations<CR>", opts)
	vim.keymap.set("n", "gD", ":Telescope lsp_type_definitions<CR>", opts)
	vim.keymap.set("n", "gd", ":Telescope lsp_definitions<CR>", opts)
	vim.keymap.set("n", "gr", ":Telescope lsp_references<CR>", opts)
end)

-- technically these are "diagnostic signs"
lsp_zero.set_sign_icons({
	error = "✘",
	warn = "▲",
	hint = "⚑",
	info = "»",
})

-- Virtual lines
require("lsp_lines").setup({})
vim.diagnostic.config({
	virtual_text = false,
})
vim.diagnostic.config({ virtual_lines = { prefix = "" } })

require("mason").setup({})
require("mason-lspconfig").setup({
	-- Replace the language servers listed here
	-- with the ones you want to install
	ensure_installed = {
		"rust_analyzer",
		"gopls",
		-- "tsserver",
		-- "pyright",
		-- "terraformls",
		-- "golangci_lint_ls",
		-- "clojure_lsp",
	},
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,
	},
})

-- TODO: Find way to run formatters for LSP formatting (an alternative to null-ls)
-- vim.api.nvim_create_augroup('AutoFormatting', {})
-- vim.api.nvim_create_autocmd('BufWritePre', {
--   group = 'AutoFormatting',
--   callback = function()
--     vim.lsp.buf.format()
--   end,
-- })

-- null-ls needs to be setup after lsp-zero
local ok, null_ls = pcall(require, "null-ls")
if ok then
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
	null_ls.setup({
		sources = {
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.terraform_fmt,
			null_ls.builtins.formatting.goimports,
			null_ls.builtins.formatting.gofmt,
			-- null_ls.builtins.formatting.buf, -- profobuf, does not work (see: https://github.com/bufbuild/buf/issues/1035)
			-- null_ls.builtins.formatting.rustfmt,
			null_ls.builtins.formatting.prettier,
			null_ls.builtins.diagnostics.vale,
			null_ls.builtins.diagnostics.golangci_lint,
		},
		on_attach = function(client, bufnr)
			-- Format on save
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({
							bufnr = bufnr,
							filter = function(client)
								return client.name == "null-ls"
							end,
							timeout_ms = 2000,
							async = false,
						})
					end,
				})
			end
		end,
	})
end

local cmp = require("cmp")

-- this is the function that loads the extra snippets
-- from rafamadriz/friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
	sources = {
		{ name = "copilot" },
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "luasnip", keyword_length = 2 },
		{ name = "buffer", keyword_length = 3 },
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		-- confirm completion item
		["<Enter>"] = cmp.mapping.confirm({ select = true }),

		-- next/previous item
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),

		-- trigger completion menu
		["<C-Space>"] = cmp.mapping.complete(),

		-- scroll up and down the documentation window
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
	}),

	formatting = lsp_zero.cmp_format({ details = true }),
})
