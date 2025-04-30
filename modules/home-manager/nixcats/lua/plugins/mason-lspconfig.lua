local M = {
  "williamboman/mason-lspconfig.nvim",
  -- Disable Mason in a Nix environment
  -- Nix serves as the package manager
  enabled = require("nixCatsUtils").lazyAdd(true, false),
  event = "BufReadPre",
  dependencies = {
    { "williamboman/mason.nvim" },
    { "neovim/nvim-lspconfig" },
    { "j-hui/fidget.nvim", opts = {} },
  },
  opts = {
    ensure_installed = {
      "bashls",
      "clangd",
      "cssls",
      "eslint",
      "gopls",
      "html",
      "tsserver",
      "jsonls",
      "lua_ls",
      "pylsp",
      "ruby_lsp",
      "rust_analyzer",
      "vimls",
      "lemminx",
      "yamlls",
      "zls",
    },
    handlers = {
      ["lua_ls"] = function ()
        local lspconfig = require("lspconfig")
        lspconfig.lua_ls.setup {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" }
              }
            }
          }
        }
      end,
    },
  },
}

return M

