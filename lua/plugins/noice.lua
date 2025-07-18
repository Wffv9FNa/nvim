local M = {}

M.setup = function()
  require("noice").setup({
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    routes = {
      {
        filter = {
          event = "msg_show",
          any = {
            { find = "%d+L, %d+B" },
            { find = "; after #%d+" },
            { find = "; before #%d+" },
          },
        },
        view = "popup",
      },
    },
    views = {
      popup = {
        position = {
          row = "50%",
          col = "50%",
        },
        size = {
          width = "60%",
          height = "auto",
        },
        border = {
          style = "rounded"
        },
        win_options = {
          winblend = 10,
        },
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
    },
  })

  -- Keymaps
  local map = vim.keymap.set
  map("n", "<leader>sn", "", { desc = "+noice" })
  map("c", "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, { desc = "Redirect Cmdline" })
  map("n", "<leader>snl", function() require("noice").cmd("last") end, { desc = "Noice Last Message" })
  map("n", "<leader>snh", function() require("noice").cmd("history") end, { desc = "Noice History" })
  map("n", "<leader>sna", function() require("noice").cmd("all") end, { desc = "Noice All" })
  map("n", "<leader>snd", function() require("noice").cmd("dismiss") end, { desc = "Dismiss All" })
  map("n", "<leader>snt", function() require("noice").cmd("pick") end, { desc = "Noice Picker (Telescope/FzfLua)" })
  map({"i", "n", "s"}, "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, { silent = true, expr = true, desc = "Scroll Forward" })
  map({"i", "n", "s"}, "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, { silent = true, expr = true, desc = "Scroll Backward" })
end

return function()
  M.setup()
end
