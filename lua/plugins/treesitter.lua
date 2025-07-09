require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua", "vim", "bash", "python" }, -- extend as needed
  highlight = {
    enable = true,                -- Syntax highlighting
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,                -- Improved indentation
  },
})

