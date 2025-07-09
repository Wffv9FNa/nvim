-- Cyberdream theme configuration
require("cyberdream").setup({
  -- Set dark or light variant
  variant = "default", -- "default" for dark, "light" for light variant

  -- Enable transparent background
  transparent = false,

  -- Reduce color saturation (0 = grayscale, 1 = full color)
  saturation = 1,

  -- Enable italic comments
  italic_comments = true,

  -- Replace all fillchars with ' ' for a cleaner look
  hide_fillchars = false,

  -- Apply borderless look to UI elements like Telescope
  borderless_pickers = true,

  -- Set terminal colors
  terminal_colors = true,

  -- Enable caching for faster startup (generate cache with :CyberdreamBuildCache)
  cache = false,

  -- Enable theme for various plugins
  extensions = {
        -- alpha = true,
        --blinkcmp = true,
        --cmp = true,
        --dashboard = true,
        --fzflua = true,
        --gitpad = true,
        --gitsigns = true,
        --grapple = true,
        --grugfar = true,
        --heirline = true,
        --helpview = true,
        --hop = true,
        --indentblankline = true,
        --kubectl = true,
        lazy = true,
        --leap = true,
        --markdown = true,
        --markview = true,
        --mini = true,
        --noice = true,
        --neogit = true,
        --notify = true,
        --rainbow_delimiters = true,
        --snacks = true,
        --telescope = true,
        treesitter = true
        --treesittercontext = true,
        --trouble = true,
        --whichkey = true
  }
})
