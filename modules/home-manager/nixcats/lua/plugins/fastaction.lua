local M = {
  "Chaitanyabsprip/fastaction.nvim",
  keys = {
    {
      "<leader>a",
      function() require("fastaction").code_action() end,
      mode = { "n", "x" },
      desc = "Code [A]ctions",
    },
    {
      "<leader>ca",
      function() require("fastaction").code_action() end,
      mode = { "n", "x" },
      desc = "[C]ode [A]ctions",
    },
    {
      "<A-CR>",
      function() require("fastaction").code_action({ select_first = true }) end,
      mode = { "n", "x" },
      desc = "Select and apply first code action",
    },
  },
  opts = {
    popup = {
      border = vim.g.border,
    },
    title = false,
  },
}

return M
