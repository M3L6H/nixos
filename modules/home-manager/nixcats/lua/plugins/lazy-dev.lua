local M = {
  "folke/lazydev.nvim",
  ft = "lua", -- Only load on lua files
  opts = {
    library = {
      "lazy.nvim",
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    },
  },
}

return M
