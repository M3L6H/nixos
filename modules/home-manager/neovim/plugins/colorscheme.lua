local M = {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = function()
    return {
      style = "night"
    }
  end,
  config = function(_, opts)
    local tokyonight = require("tokyonight")
    tokyonight.setup(opts)
    tokyonight.load()

    -- Make things transparent
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end,
}

return M

