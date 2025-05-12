local utils = require("nixCatsUtils")

local M = {
  "nvim-treesitter/nvim-treesitter",
  build = utils.lazyAdd(":TSUpdate"),
  event = "BufReadPost",
  opts = {
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    autopairs = { enable = true },
    ensure_installed = utils.lazyAdd({
      "bash",
      "c",
      "cpp",
      "css",
      "go",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "ruby",
      "rust",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
      "yuck",
    }, false),
    auto_install = utils.lazyAdd(true, false),
    sync_install = false,
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<Tab>",
        node_incremental = "<Tab>",
        scope_incremental = false,
        node_decremental = "<S-Tab>",
      },
    },
  },
  config = function(_, opts) require("nvim-treesitter.configs").setup(opts) end,
}

return M
