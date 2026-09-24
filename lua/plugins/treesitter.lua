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
  if vim.fn.executable("tree-sitter") == 1 then
    require("nvim-treesitter").install(parsers)
  else
    vim.notify(
      "nvim-treesitter: tree-sitter CLI not found, so no parsers can be built. Run `chezmoi apply`.",
      vim.log.levels.ERROR
    )
  end

  vim.api.nvim_create_autocmd("FileType", {
    callback = function()
      if pcall(vim.treesitter.start) then
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
    end,
  })
end
