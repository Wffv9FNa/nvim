-- Local Variables for easy reading
local opt = vim.opt
local g = vim.g

-- Tabs & indentation
opt.tabstop = 4                -- Number of spaces tabs count for
opt.shiftwidth = 4             -- Size of an indent
opt.expandtab = true           -- Use spaces instead of tabs
opt.smartindent = true         -- Autoindent new lines

-- Line wrapping
opt.wrap = false               -- Disable line wrap

-- Search
opt.ignorecase = true          -- Case-insensitive search...
opt.smartcase = true           -- ...unless capital letters are used
opt.incsearch = true           -- Incremental search
opt.hlsearch = true            -- Highlight search matches

-- Cursor
opt.cursorline = true          -- Highlight current line
opt.scrolloff = 8              -- Keep 8 lines above/below cursor

-- Appearance
opt.termguicolors = true       -- True color support
opt.signcolumn = "yes"         -- Always show sign column
--opt.colorcolumn = "80"         -- Visual ruler at 80 chars

-- Splits
opt.splitbelow = true          -- Horizontal splits below
opt.splitright = true          -- Vertical splits to the right


-- Undo and swap
opt.undofile = true            -- Persistent undo saved to file
opt.swapfile = false           -- Disable swap (unsaved changes)
opt.backup = false             -- Disable backup

-- Performance
opt.updatetime = 250           -- Faster completion
opt.timeoutlen = 500           -- Shorter key sequence timeout

-- File encoding
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- Misc
g.mapleader = " "              -- Set <Leader> to space
