local M = {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  config = function()
    local lspconfig = require("lspconfig")

    for _,v in pairs(vim.g.lsps) do
      lspconfig[v].setup({})
    end
  end,
}

return M

