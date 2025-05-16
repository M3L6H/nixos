local utils = require("nixCatsUtils")

local lsps = {
  lua_ls = {
    pattern = { "*.lua" },
    settings = {
      Lua = {
        signatureHelp = { enable = true },
        diagnostics = {
          globals = { "nixCats" },
        },
        -- Inlay hints
        hint = {
          enable = true,
          arrayIndex = "Disable",
          paramName = "Literal",
        },
      },
    },
  },
  -- We shouldn't need nixd if we are running outside of nixCats!
  nixd = utils.lazyAdd(false, {
    pattern = { "*.nix" },
    settings = {
      nixd = {
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
      },
    },
  }),
}

local M = {
  "neovim/nvim-lspconfig",
  dependencies = { { "saghen/blink.cmp" } },
  cmd = { "LspInfo", "LspLog", "LspStart", "LspStop", "LspRestart" },
  init = function()
    local lspConfigPath = utils.lazyAdd(
      require("lazy.core.config").options.root .. "/nvim-lspconfig",
      nixCats.extra("nixdExtras.nvim_lspconfig")
    )
    vim.opt.runtimepath:prepend(lspConfigPath)

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

    -- We use Mason-lspconfig when we are not in the nixcats world
    if utils.isNixCats then
      for lsp, config in pairs(lsps) do
        if config then
          -- Merge any manually specified capabilities
          config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities or {})
          vim.lsp.config(lsp, config)
        end
      end
    end

    -- We use Mason-lspconfig when we are not in the nixcats world
    if utils.isNixCats then
      local buf_read_pre_lsp = vim.api.nvim_create_augroup("buf-read-pre-lsp", { clear = true })
      local lsp_attach = vim.api.nvim_create_augroup("lsp-attach", { clear = true })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = lsp_attach,
        pattern = "*",
        callback = function(event)
          local km = vim.keymap
          km.set("n", "<leader>cr", function() vim.lsp.rename() end, { desc = "[C]ode [R]ename" })
          km.set(
            "n",
            "<leader>dd",
            function() vim.diagnostic.open_float() end,
            { desc = "[D]iagnostics [D]isplay" }
          )

          -- Get client
          local client = vim.lsp.get_client_by_id(event.data.client_id)

          if client and client.server_capabilities.inlayHintProvider then
            vim.g.inlay_hints_visible = true
            vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
          end
        end,
        desc = "Additional LSP init after attach",
      })

      for lsp, config in pairs(lsps) do
        if config then
          vim.api.nvim_create_autocmd("BufReadPre", {
            group = buf_read_pre_lsp,
            pattern = config.pattern,
            callback = function() vim.lsp.enable(lsp) end,
            once = true,
            desc = "Enable lsp in BufReadPre",
          })

          if config.on_attach then
            vim.api.nvim_create_autocmd("LspAttach", {
              group = lsp_attach,
              pattern = config.pattern,
              callback = config.on_attach,
              desc = "Setup LSP-specific behavior on attach",
            })
          end
        end
      end
    end
  end,
}

return M
