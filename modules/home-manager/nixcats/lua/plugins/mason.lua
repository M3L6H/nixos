local M = {
  "williamboman/mason.nvim",
  -- Disable Mason in a Nix environment
  -- Nix serves as the package manager
  enabled = require("../nixCatsUtils").lazyAdd(true, false),
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

