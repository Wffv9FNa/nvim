local servers = { "lua_ls", "bashls", "jsonls", "yamlls" }

require("mason").setup({
  ui = { border = "rounded" },
})

-- Must follow mason.setup(): ensure_installed and automatic_enable read its registry.
require("mason-lspconfig").setup({
  ensure_installed = servers,
  -- Allowlist, not `true`: `true` enables whatever mason has installed, which varies per machine.
  automatic_enable = servers,
})
