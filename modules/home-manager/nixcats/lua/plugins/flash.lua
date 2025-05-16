local M = {
  "folke/flash.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<CR>",
      mode = { "n", "x", "o" },
      function() require("flash").jump() end,
      desc = "Flash",
    },
    {
      "<S-CR>",
      mode = { "n", "x", "o" },
      function() require("flash").treesitter() end,
      desc = "Flash treesitter",
    },
    {
      "<C-CR>",
      mode = { "c" },
      function() require("flash").toggle() end,
      desc = "Toggle Flash Search",
    },
  },
  ---@type Flash.Config
  ---@diagnostic disable-next-line missing-fields
  opts = {
    jump = {
      nohlsearch = true,
      autojump = true,
    },
    label = {
      rainbow = {
        enabled = false,
      },
    },
    modes = {
      char = {
        enabled = false,
      },
    },
  },
}

return M
