require("lazydev").setup({
  library = {
    -- Bare `path` resolves relative to lazy.nvim's plugin dir, not the cwd.
    { path = "wezterm-types", mods = { "wezterm" } },
    { path = "${3rd}/luv/library", words = { "vim%.uv", "vim%.loop" } },
  },
})
