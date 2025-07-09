-- Define autocommands using Neovim's Lua API
local api = vim.api

-- Create an augroup to group these autocmds (allows clear + reload)
local augroup = api.nvim_create_augroup("CoreAutocmds", { clear = true })

-- Remove trailing whitespace on save
api.nvim_create_autocmd("BufWritePre", {
    group = augroup,
    desc = "Strip trailing whitespace before save",
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- Auto-reload file if changed outside of Neovim
api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
    group = augroup,
    desc = "Auto read file if changed externally",
    command = "checktime",
})

-- Resize splits equally when window is resized
api.nvim_create_autocmd("VimResized", {
    group = augroup,
    desc = "Equalize window splits on resize",
    command = "wincmd =",
})
