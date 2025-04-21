local M = {
  "williamboman/mason-lspconfig.nvim",
  -- Disable Mason in a Nix environment
  -- Nix serves as the package manager
  enabled = require("../nixCatsUtils").lazyAdd(true, false),
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
      function(server_name) -- default handler
        require("lspconfig")[server_name].setup({
          on_attach = function(ev)
            local km = vim.keymap

            local opts = { buffer = ev.buf, noremap = true, silent = true }
            -- km.set("n", "gD", vim.lsp.buf.declaration, opts)
            -- km.set("n", "gd", vim.lsp.buf.definition, opts)
            -- km.set("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)
            -- km.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", opts)
            -- km.set("n", "K", vim.lsp.buf.hover, opts)
            -- km.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            -- km.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            -- km.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
          end,
        })
      end,
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

