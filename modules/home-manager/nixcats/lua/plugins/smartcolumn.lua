local M = {
  "m4xshen/smartcolumn.nvim",
  event = "BufEnter",
  opts = {
    colorcolumn = "100",
    disabled_filetypes = {
      "checkhealth",
      "help",
      "lazy",
      "lspinfo",
      "mason",
      "oil",
      "Trouble",
    },
    custom_colorcolumn = {
      git = { "50", "72" },
    },
    editorconfig = true,
  },
}

return M
