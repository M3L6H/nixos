-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  install = { colorscheme = { "tokyonight" } },
  defaults = { lazy = true },
  checker = { enabled = true },
})

