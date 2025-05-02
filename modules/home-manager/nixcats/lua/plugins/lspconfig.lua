local utils = require("nixCatsUtils")

local lsps = {
  lua_ls = {
    on_init = function(client)
      if client.workspace_folders then
        local path = client.workspace_folders[1].name
        if
          path ~= vim.fn.stdpath("config")
          and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
        then
          return
        end
      end

      client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
        runtime = {
          version = "LuaJIT",
        },
        workspace = {
          checkThirdParty = false,
          library = {
            vim.env.VIMRUNTIME,
          },
        },
      })
    end,
    settings = {
      Lua = {},
    },
  },
  -- We shouldn't need nixd if we are running outside of nixCats!
  nixd = utils.lazyAdd(false, {
    nixpkgs = {
      expr = nixCats.extra("nixdExtras.nixpkgs") or [[import <nixpkgs> {}]],
    },
    options = {
      nixos = {
        expr = nixCats.extra("nixdExtras.nixos_options"),
      },
      ["home-manager"] = {
        expr = nixCats.extra("nixdExtras.home_manager_options"),
      },
    },
    formatting = { command = { "nixfmt" } },
  }),
}

local M = {
  "neovim/nvim-lspconfig",
  dependencies = { { "saghen/blink.cmp" } },
  event = "BufReadPre",
  keys = {
    { "<leader>cr", function() vim.lsp.buf.rename() end, desc = "Code rename" },
  },
  config = function()
    local lspconfig = require("lspconfig")

    for lsp, opts in pairs(lsps) do
      if opts then
        -- Merge any manually specified capabilities
        opts.capabilities = require("blink.cmp").get_lsp_capabilities(opts.capabilities or {})
        lspconfig[lsp].setup(opts)
      end
    end
  end,
  init = function()
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.INFO] = "󰋼 ",
          [vim.diagnostic.severity.HINT] = "󰌵 ",
        },
      },
    })
  end,
}

return M
