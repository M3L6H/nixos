local M = {
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  event = "BufReadPre",
  keys = {
    { "<C-m>", "<cmd>Mason<cr>" },
  },
  opts = {
    pip = {
      upgrade_pip = true,
    },
  },
}

return M

