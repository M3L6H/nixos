local M = {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  keys = {
    { "<leader>cf", function() require("conform").format() end, desc = "Code format" },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        local conform = require("conform")
        conform.format({ bufnr = args.buf, timeout_ms = 500 })
      end,
    })
  end,
}

return M
