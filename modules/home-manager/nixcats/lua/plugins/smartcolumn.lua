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
      "snacks_dashboard",
      "Trouble",
    },
    custom_colorcolumn = {
      git = { "50", "72" },
    },
    editorconfig = true,
  },
}

return M
