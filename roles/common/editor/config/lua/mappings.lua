-- Moving along buffers
vim.keymap.set("n", "<C-l>", ":bn<CR>")
vim.keymap.set("n", "<C-h>", ":bp<CR>")

-- Moving lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Disable arrows
vim.keymap.set("n", "<up>", "<nop>")
vim.keymap.set("n", "<down>", "<nop>")
vim.keymap.set("n", "<left>", "<nop>")
vim.keymap.set("n", "<right>", "<nop>")

vim.keymap.set("n", "<F1>", "<nop>")

-- Mappings
vim.keymap.set("n", "<leader>da", ':r!date +"\\#\\# \\%a \\%Y-\\%m-\\%d"<CR>')
