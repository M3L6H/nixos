local M = {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
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
  },
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
}

return M
