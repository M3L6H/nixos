local M = {
  "NMAC427/guess-indent.nvim",
  event = "BufEnter",
  opts = {
    buftype_exclude = {
      "checkhealth",
      "help",
      "lazy",
      "lspinfo",
      "mason",
      "oil",
      "snacks_dashboard",
      "Trouble",
    },
  },
}

return M
