require("dap-go").setup()
require("dapui").setup()

---- DAP / DAPUI
vim.keymap.set("n", "<leader>dd", ":lua require'dapui'.toggle()<CR>", { silent = true })
vim.keymap.set("n", "<leader>dc", ":lua require'dap'.continue()<CR>", { silent = true })
vim.keymap.set("n", "<leader>dn", ":lua require'dap'.step_over()<CR>", { silent = true })
vim.keymap.set("n", "<leader>di", ":lua require'dap'.step_into()<CR>", { silent = true })
vim.keymap.set("n", "<leader>do", ":lua require'dap'.step_out()<CR>", { silent = true })
vim.keymap.set("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", { silent = true })
