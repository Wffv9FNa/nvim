local wk = require("which-key")

-- Simple, minimal setup
wk.setup({
  preset = "modern",
})

-- Document existing keymaps (defined in lua/core/keymaps.lua)
-- WhichKey will automatically detect the actual mappings and show them
wk.add({
  -- Window navigation (these are also automatically detected)
  { "<C-h>", desc = "Navigate left window" },
  { "<C-j>", desc = "Navigate down window" },
  { "<C-k>", desc = "Navigate up window" },
  { "<C-l>", desc = "Navigate right window" },

  -- Leader key groups and descriptions
  { "<leader>w", desc = "Save file" },

  { "<leader>f", group = "File/Find" },
  { "<leader>fe", desc = "File Explorer" },
  { "<leader>fn", desc = "New File" },
  { "<leader>fq", desc = "Quit" },
  { "<leader>fx", desc = "Save & Quit" },
  { "<leader>ff", desc = "Find Files" },
  { "<leader>fw", desc = "Find Word (Live Grep)" },
  { "<leader>fr", desc = "Find Recent Files" },
  { "<leader>fc", desc = "Find Colorscheme" },

  { "<leader>b", group = "Buffer" },
  { "<leader>bl", desc = "List Buffers" },
  { "<leader>bd", desc = "Delete Buffer" },
  { "<leader>bn", desc = "Next Buffer" },
  { "<leader>bp", desc = "Previous Buffer" },
  { "<leader>bb", desc = "Browse Buffers (Telescope)" },

  { "<leader>s", group = "Split" },
  { "<leader>sv", desc = "Vertical Split" },
  { "<leader>sh", desc = "Horizontal Split" },
  { "<leader>sc", desc = "Close Split" },
  { "<leader>s=", desc = "Balance Splits" },
})
