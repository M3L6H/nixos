local M = {
  "scottmckendry/cyberdream.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    variant = "dark",
    transparent = true,
    italic_comments = true,
    hide_fillchars = true,
    borderless_pickers = true,
    cache = false,
    colors = {
      green = "#ffbd5e",
      orange = "#5eff6c",
    },
  },
  init = function()
    vim.cmd("colorscheme cyberdream")
  end,
}

return M

