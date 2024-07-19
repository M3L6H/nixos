local M = {
  "stevearc/oil.nvim",
  event = "VimEnter",
  dependencies = {
    { "echasnovski/mini.icons" },
  },
  keys = {
    { "-", "<cmd>Oil<cr>", mode = "n", desc = "Open parent directory" },
  },
  opts = function()
    return {
      skip_confirm_for_simple_edits = true,
      show_hidden = true,
      is_always_file = function(name, _)
        return vim.startswith(name, ".git")
      end,
    }
  end,
  config = function(_, opts)
    local oil = require("oil")
    oil.setup(opts)
  end,
}

return M

