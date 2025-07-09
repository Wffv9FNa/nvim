-- Local variables for easier reading
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local n, i, v, x, t = "n", "i", "v", "x", "t"

-- Navigate between windows using Ctrl + h/j/k/l
keymap(n, "<C-h>", "<C-w>h", opts)             -- Move to left window   Ctrl-h
keymap(n, "<C-j>", "<C-w>j", opts)             -- Move to bottom window Ctrl-j
keymap(n, "<C-k>", "<C-w>k", opts)             -- Move to top window    Ctrl-k
keymap(n, "<C-l>", "<C-w>l", opts)             -- Move to right window  Ctrl-l

-- Exit terminal mode with Esc
keymap(t, "<Esc>", [[<C-\><C-n>]], opts)       -- Leave terminal insert mode
