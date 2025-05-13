local M = {
  "mawkler/demicolon.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  keys = {
    { ";", desc = "Go to next" },
    { ",", desc = "Go to prev" },
  },
  opts = {
    disabled_keys = { "p", "I", "A", "i" },
  },
}

return M
