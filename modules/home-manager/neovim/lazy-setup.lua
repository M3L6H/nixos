-- Setup lazy.nvim
require("lazy").setup("plugins", {
  install = { colorscheme = { "tokyonight" } },
  defaults = { lazy = true },
  checker = { enabled = true },
})

