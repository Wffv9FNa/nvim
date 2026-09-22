local ok, configs = pcall(require, "nvim-treesitter.configs")
if ok then
  -- Legacy API (nvim-treesitter < 1.0)
  configs.setup({
    ensure_installed = { "lua", "vim", "bash", "python" },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },
  })
else
  -- New API (nvim-treesitter >= 1.0)
  require("nvim-treesitter").setup({
    ensure_installed = { "lua", "vim", "bash", "python" },
  })

  vim.api.nvim_create_autocmd("FileType", {
    callback = function()
      if pcall(vim.treesitter.start) then
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
    end,
  })
end

