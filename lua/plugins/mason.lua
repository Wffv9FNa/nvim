local servers = { "lua_ls", "bashls", "jsonls", "yamlls" }

-- Mason has no lua-language-server build for Termux (bionic libc), so use a
-- system binary where one exists. automatic_enable only covers mason-installed
-- packages, so a system server has to be enabled by hand.
local system_servers = {}
if vim.fn.executable("lua-language-server") == 1 then
  table.insert(system_servers, "lua_ls")
end
local mason_servers = vim.tbl_filter(function(server)
  return not vim.list_contains(system_servers, server)
end, servers)

require("mason").setup({
  ui = { border = "rounded" },
})

-- Must follow mason.setup(): ensure_installed and automatic_enable read its registry.
require("mason-lspconfig").setup({
  ensure_installed = mason_servers,
  -- Allowlist, not `true`: `true` enables whatever mason has installed, which varies per machine.
  automatic_enable = mason_servers,
})

vim.lsp.enable(system_servers)
