local M = {
  "stevearc/oil.nvim",
  event = "VimEnter",
  dependencies = {
    { "echasnovski/mini.icons", opts = {} },
  },
  keys = {
    { "-", "<cmd>Oil<cr>", mode = "n", desc = "Open parent directory" },
  },
  opts = {
    skip_confirm_for_simple_edits = true,
    lsp_file_methods = {
      autosave_changes = true,
    },
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, _)
        return name == ".git" or name == ".."
      end,
    },
  },
  config = function(_, opts)
    local oil = require("oil")
    oil.setup(opts)

    -- save when exiting insert mode
    vim.api.nvim_create_autocmd("InsertLeave", {
      pattern = "oil://*",
      callback = function()
        oil.save()
      end,
    })
  end,
}

return M

