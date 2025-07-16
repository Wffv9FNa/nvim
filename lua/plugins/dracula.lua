-- Dracula theme configuration

return function()
  require("dracula").setup({
    -- Show the '~' characters after the end of buffers
    show_end_of_buffer = true,

    -- Use transparent background
    transparent_bg = false,

    -- Set custom lualine background colour
    lualine_bg_color = "#44475a",

    -- Enable italic comments
    italic_comment = true,

    -- Override default colours (optional)
    colors = {
      -- Keep default Dracula colours
    },

    -- Override default highlights (optional)
    overrides = {
      -- Add any custom highlight overrides here
    }
  })
end
