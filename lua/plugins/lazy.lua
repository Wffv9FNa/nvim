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

-- ___  ____ ____ ____ _  _ _    ____
-- |  \ |__/ |__| |    |  | |    |__|
-- |__/ |  \ |  | |___ |__| |___ |  |
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("plugins.dracula")()
      vim.cmd("colorscheme dracula")
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

  -- ___ ____ _    ____ ____ ____ ____ ___  ____
  --  |  |___ |    |___ [__  |    |  | |__] |___
  --  |  |___ |___ |___ ___] |___ |__| |    |___
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make"
      }
    },
    config = function()
      require("plugins.telescope")
    end,
  },

  -- _    _  _ ____ _    _ _  _ ____
  -- |    |  | |__| |    | |\ | |___
  -- |___ |__| |  | |___ | | \| |___
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("plugins.lualine")
    end,
  },

  -- _  _ ____ _ ____ ____
  -- |\ | |  | | |    |___
  -- | \| |__| | |___ |___
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim"
    },
    config = function(_, opts)
      -- HACK: noice shows messages from before it was enabled,
      -- but this is not ideal when Lazy is installing plugins,
      -- so clear the messages in this case.
      if vim.o.filetype == "lazy" then
        vim.cmd([[messages clear]])
      end
      require("plugins.noice")()
    end,
  },
})
