local dap = require("dap")
local dapui = require("dapui")

require("dap-go").setup()
dapui.setup()

-- DAP / DAPUI
vim.keymap.set("n", "<leader>dd", dapui.toggle, { silent = true })
vim.keymap.set("n", "<leader>dc", dap.continue, { silent = true })
vim.keymap.set("n", "<leader>dn", dap.step_over, { silent = true })
vim.keymap.set("n", "<leader>di", dap.step_into, { silent = true })
vim.keymap.set("n", "<leader>do", dap.step_out, { silent = true })
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { silent = true })
