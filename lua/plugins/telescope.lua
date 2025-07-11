local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "truncate" },
    file_ignore_patterns = { "%.git/", "node_modules", "%.npm" },

    -- Layout configuration
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },

    -- Enable file previewer
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

    -- Set vimgrep arguments based on available tools
    vimgrep_arguments = vim.fn.executable("rg") == 1 and {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden"
    } or vim.fn.executable("grep") == 1 and {
      "grep",
      "--recursive",
      "--line-number",
      "--exclude-dir=.git",
      "--exclude-dir=node_modules",
      "--binary-files=without-match",
      "--color=never"
    } or {
      -- Fallback to basic grep
      "grep",
      "-r",
      "-n",
      "--color=never"
    },

    mappings = {
      i = {
        -- Insert mode mappings
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-c>"] = actions.close,
        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,
        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,
        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.complete_tag,
        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
      },

      n = {
        -- Normal mode mappings
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,
        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,
        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,
        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,
        ["?"] = actions.which_key,
      },
    },
  },

  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
    find_files = {
      -- Use find as fallback if rg is not available
      find_command = vim.fn.executable("rg") == 1
        and { "rg", "--files", "--hidden", "--glob", "!**/.git/*" }
        or vim.fn.executable("fd") == 1
        and { "fd", "--type", "f", "--hidden", "--exclude", ".git" }
        or { "find", ".", "-type", "f" },
      previewer = true,
      layout_strategy = "horizontal",
    },

    live_grep = {
      additional_args = function(opts)
        return vim.fn.executable("rg") == 1 and {"--hidden"} or {}
      end,
      previewer = true,
      layout_strategy = "horizontal",
      -- Explicitly set the grep command if rg is not available
      grep_open_files = false,
      prompt_title = "Live Grep",
    },

    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
      previewer = true,
      initial_mode = "normal",
      layout_strategy = "horizontal",
      mappings = {
        i = {
          ["<C-d>"] = actions.delete_buffer,
        },
        n = {
          ["dd"] = actions.delete_buffer,
        },
      },
    },

    colorscheme = {
      enable_preview = true,
      layout_strategy = "horizontal",
    },

    lsp_references = {
      initial_mode = "normal",
      layout_strategy = "vertical",
      sorting_strategy = "ascending",
      layout_config = {
        prompt_position = "top",
      },
    },

    lsp_definitions = {
      initial_mode = "normal",
      layout_strategy = "vertical",
      sorting_strategy = "ascending",
      layout_config = {
        prompt_position = "top",
      },
    },

    lsp_declarations = {
      initial_mode = "normal",
      layout_strategy = "vertical",
      sorting_strategy = "ascending",
      layout_config = {
        prompt_position = "top",
      },
    },

    lsp_implementations = {
      initial_mode = "normal",
      layout_strategy = "vertical",
      sorting_strategy = "ascending",
      layout_config = {
        prompt_position = "top",
      },
    },
  },

  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
})

-- Load extensions
telescope.load_extension('fzf')

-- Custom live_grep function for better compatibility
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fw', function()
  if vim.fn.executable("rg") == 1 then
    builtin.live_grep()
  else
    -- Fallback to grep_string with prompting
    builtin.grep_string({
      search = vim.fn.input("Grep for > "),
      use_regex = true,
    })
  end
end, { desc = "Live Grep / Grep String" })
