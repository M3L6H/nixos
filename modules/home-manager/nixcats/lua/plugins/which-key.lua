local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>?",
      function() require("which-key").show({ global = false }) end,
      desc = "[Buffer local] Which key?",
    },
  },
  opts = {
    preset = "modern",
  },
}

return M
