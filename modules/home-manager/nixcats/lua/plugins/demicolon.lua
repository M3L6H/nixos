local M = {
  "mawkler/demicolon.nvim",
  enabled = true,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  event = "BufReadPost",
  opts = {
    disabled_keys = { "p", "I", "A", "i" },
  },
}

return M
