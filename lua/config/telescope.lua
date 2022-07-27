local ok, telescope = pcall(require, 'telescope')
if not ok then
  return
end

local actions = require "telescope.actions"

telescope.setup {
  defaults = {
    prompt_prefix = "  ",
    selection_caret = "❯ ",
    sorting_strategy = "ascending",
    mappings = {
      n = {
        ["q"] = actions.close,
      },
    },
    file_ignore_patterns = {
      ".git",
      "vendor",
      "node_modules",
    }
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      hidden = true,
      no_ignore = true,
    },
    buffers = {
      layout_config = { preview_width = 0.5 },
      ignore_current_buffer = true,
      sort_mru = true,
      mappings = {
        i = {
          ["<c-d>"] = actions.delete_buffer,
        },
        n = {
          ["<c-d>"] = actions.delete_buffer,
        },
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  }
}

telescope.load_extension("fzf")

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<Leader>ff', '<cmd>Telescope find_files<cr>', opts)
vim.api.nvim_set_keymap('n', '<Leader>fb', '<cmd>Telescope buffers<cr>', opts)
