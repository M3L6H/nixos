local M = {
  "nvim-telescope/telescope.nvim",
  event = "BufReadPre",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  keys = {
    { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>" },
    { "<leader>fs", "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input('grep > ') })<cr>" },
  },
  opts = function()
    local actions = require("telescope.actions")
    return {
      defaults = {
        mappings = { i = { ["<esc>"] = actions.close } },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case"
        },
      },
    }
  end,
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    telescope.load_extension("fzf")

    -- Transparent background
    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
  end,
}

return M

