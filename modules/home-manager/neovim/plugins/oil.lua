local M = {
  "stevearc/oil.nvim",
  event = "VimEnter",
  dependencies = {
    { "echasnovski/mini.icons" },
  },
  keys = {
    { "-", "<cmd>Oil<cr>", mode = "n", desc = "Open parent directory" },
  },
  opts = {
    skip_confirm_for_simple_edits = true,
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, _)
        return vim.startswith(name, ".git")
      end,
    },
  },
  config = function(_, opts)
    local oil = require("oil")
    oil.setup(opts)
  end,
}

return M

