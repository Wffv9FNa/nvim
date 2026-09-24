require("mason").setup({
  ui = { border = "rounded" },
})

-- Must follow mason.setup(): ensure_installed and automatic_enable read its registry.
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls" },
  -- Why no per-server setup(): this vim.lsp.enable()s each server from nvim-lspconfig's defaults.
  automatic_enable = true,
})
