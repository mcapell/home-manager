-- Colorscheme
vim.o.termguicolors = true
-- vim.cmd'colorscheme base16-apprentice'
vim.cmd("colorscheme kanagawa")
vim.o.background = "dark"

-- Numbers
vim.o.number = true
vim.o.relativenumber = true

-- Search
vim.o.hlsearch = false
vim.o.incsearch = true

-- Let scroll using the mouse
vim.o.mouse = "nicr"

-- Allow to change buffer without saving it
vim.o.hidden = true

-- Set search case insensitive
vim.o.ignorecase = true

-- Unset backup  file
vim.o.swapfile = false

-- Tab behaviour
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.cmd([[
    autocmd Filetype go setlocal noexpandtab
]])

vim.o.showmatch = true
vim.o.wrap = false

-- Jump 5 lines when running out of the screen
vim.o.scrolljump = 5

-- Indicate jump out of the screen when N lines before end of the screen
vim.o.scrolloff = 10

-- Show end-of-line whitespaces
--
vim.cmd([[
    set list
    set listchars=tab:\|\ ,trail:·
    autocmd FileType go,gomod,lua set listchars=tab:\ \ ,trail:·
]])

-- Set custom filetypes
vim.cmd([[
    autocmd BufNewFile,BufRead *.Jenkinsfile set filetype=groovy
    autocmd BufNewFile,BufRead *.oapi set filetype=yaml
]])

-- Load local configuration files
vim.o.exrc = true

-- Enable spellcheck everywhere
vim.o.spell = true
vim.o.spelllang = "en_us"
