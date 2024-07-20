local M = {
  "folke/zen-mode.nvim",
  dependencies = {
    { "folke/twilight.nvim" },
  },
  keys = {
    { "<leader>z", "<cmd>ZenMode<cr>", mode = "n", desc = "Toggle zen mode" },
  },
  opts = {
    tmux = { enabled = true },
  },
  config = function(_, opts)
    require("zen-mode").setup(opts)
  end,
}

return M

