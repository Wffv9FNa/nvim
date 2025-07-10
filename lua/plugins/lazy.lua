local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

--  ____  _             _
-- |  _ \| |_   _  __ _(_)_ __  ___
-- | |_) | | | | |/ _` | | '_ \/ __|
-- |  __/| | |_| | (_| | | | | \__ \
-- |_|   |_|\__,_|\__, |_|_| |_|___/
--                |___/

-- Font used - CyberMedium
require("lazy").setup({

  -- ___ ____ ____ ____ ____ _ ___ ___ ____ ____
  --  |  |__/ |___ |___ [__  |  |   |  |___ |__/
  --  |  |  \ |___ |___ ___] |  |   |  |___ |  \
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",  -- Ensures parsers are up-to-date
    config = function()
      require("plugins.treesitter")
    end,
  },

  -- ____ _   _ ___  ____ ____ ___  ____ ____ ____ _  _
  -- |     \_/  |__] |___ |__/ |  \ |__/ |___ |__| |\/|
  -- |___   |   |__] |___ |  \ |__/ |  \ |___ |  | |  |
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("plugins.cyberdream")
      vim.cmd("colorscheme cyberdream")
    end,
  },

  -- _ _ _ _  _ _ ____ _  _ _  _ ____ _   _
  -- | | | |__| | |    |__| |_/  |___  \_/
  -- |_|_| |  | | |___ |  | | \_ |___   |
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins.whichkey")
    end,
  },
})

