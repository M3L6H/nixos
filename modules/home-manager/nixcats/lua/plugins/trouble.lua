local M = {
  "folke/trouble.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
  },
  cmd = "Trouble",
  keys = {
    {
      "<leader>dt",
      "<CMD>Trouble diagnostics toggle<CR>",
      desc = "[D]iagnostic [T]rouble",
    },
    {
      "<leader>ds",
      "<CMD>Trouble symbols toggle focus=false<CR>",
      desc = "[D]iagnostic [S]ymbol toggle",
    },
    {
      "<leader>dq",
      "<CMD>Trouble qflist toggle<CR>",
      desc = "[D]iagnostic [Q]uickfix",
    },
  },
  ---@class trouble.Config
  opts = {
    focus = true,
    ---@type trouble.Window.opts
    win = {
      position = "right",
      size = {
        width = 80,
      },
    },
    keys = {
      j = "next",
      k = "prev",
    },
  },
}

return M
