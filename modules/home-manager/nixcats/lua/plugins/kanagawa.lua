local M = {
  "rebelot/kanagawa.nvim",
  lazy = false,
  enabled = vim.g.colorscheme == "kanagawa",
  priority = 1000,
  opts = {
    compile = true,
    transparent = true,
    dimInactive = true,
    colors = {
      palette = {
        -- Swap green and yellow
        springGreen = "#E6C384",
        carpYellow = "#98BB6C",
      },
      theme = {
        all = {
          ui = {
            bg_dim = "none",
            bg_gutter = "none",
          },
        },
      },
    },
    overrides = function()
      return {
        NormalFloat = { bg = "none" },
        FloatBorder = { bg = "none" },
        FloatTitle = { bg = "none" },
      }
    end,
  },
  init = function()
    vim.cmd("colorscheme kanagawa-wave")
  end,
}

return M

