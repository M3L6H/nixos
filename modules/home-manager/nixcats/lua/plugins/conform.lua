local M = {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = "ConformInfo",
  keys = {
    { "<leader>cf", function() require("conform").format() end, desc = "Code format" },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      nix = { "nixfmt" },
    },
    default_format_opts = {
      lsp_format = "fallback",
    },
    format_on_save = { timeout_ms = 500 },
  },
}

return M
