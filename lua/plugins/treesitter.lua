local parsers = { "lua", "vim", "bash", "python" }

local ok, configs = pcall(require, "nvim-treesitter.configs")
if ok then
  -- Legacy API (nvim-treesitter < 1.0)
  configs.setup({
    ensure_installed = parsers,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },
  })
else
  -- New API (>= 1.0): setup() silently ignores ensure_installed, so install() instead.
  require("nvim-treesitter").install(parsers)

  vim.api.nvim_create_autocmd("FileType", {
    callback = function()
      if pcall(vim.treesitter.start) then
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
    end,
  })
end
