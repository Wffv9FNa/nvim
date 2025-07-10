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

-- File operations
keymap(n, '<leader>w', '<cmd>write<cr>', {desc = 'Save'})
keymap(n, '<leader>fe', '<cmd>Ex<cr>', {desc = 'File Explorer'})
keymap(n, '<leader>fn', '<cmd>enew<cr>', {desc = 'New File'})
keymap(n, '<leader>fq', '<cmd>q<cr>', {desc = 'Quit'})
keymap(n, '<leader>fx', '<cmd>x<cr>', {desc = 'Save & Quit'})

-- Buffer operations
keymap(n, '<leader>bl', '<cmd>ls<cr>', {desc = 'List Buffers'})
keymap(n, '<leader>bd', '<cmd>bdelete<cr>', {desc = 'Delete Buffer'})
keymap(n, '<leader>bn', '<cmd>bnext<cr>', {desc = 'Next Buffer'})
keymap(n, '<leader>bp', '<cmd>bprevious<cr>', {desc = 'Previous Buffer'})

-- Split operations
keymap(n, '<leader>sv', '<cmd>vsplit<cr>', {desc = 'Vertical Split'})
keymap(n, '<leader>sh', '<cmd>split<cr>', {desc = 'Horizontal Split'})
keymap(n, '<leader>sc', '<cmd>close<cr>', {desc = 'Close Split'})
keymap(n, '<leader>s=', '<cmd>wincmd =<cr>', {desc = 'Balance Splits'})
