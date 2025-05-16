local M = {
  "saghen/blink.cmp",
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  event = "BufEnter",
  opts = {
    keymap = {
      preset = "none",

      ["<C-space>"] = { "show", "hide_documentation", "show_documentation" },
      ["<C-e>"] = {
        function(cmp)
          vim.g.cmp_selected = false
          return cmp.hide()
        end,
        "fallback",
      },

      -- Emulate IntelliJ behavior
      ["<CR>"] = {
        function(cmp)
          -- We track this so we can use preselect without jacking up enter
          if vim.g.cmp_selected then
            vim.g.cmp_selected = false
            return cmp.accept()
          end
        end,
        "fallback",
      },
      ["<Tab>"] = {
        function(cmp)
          if cmp.snippet_active() then
            vim.g.cmp_selected = false
            return cmp.accept()
          else
            vim.g.cmp_selected = false
            return cmp.select_and_accept()
          end
        end,
        "snippet_forward",
        "fallback",
      },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },

      ["<Up>"] = {
        function(cmp)
          vim.g.cmp_selected = true
          return cmp.select_prev()
        end,
        "fallback",
      },
      ["<Down>"] = {
        function(cmp)
          vim.g.cmp_selected = true
          return cmp.select_next()
        end,
        "fallback",
      },

      ["<C-u>"] = { "scroll_documentation_up", "fallback" },
      ["<C-d>"] = { "scroll_documentation_down", "fallback" },

      -- Select Nth item from the list
      ["<A-1>"] = {
        function(cmp)
          vim.g.cmp_selected = false
          return cmp.accept({ index = 1 })
        end,
      },
      ["<A-2>"] = {
        function(cmp)
          vim.g.cmp_selected = false
          return cmp.accept({ index = 2 })
        end,
      },
      ["<A-3>"] = {
        function(cmp)
          vim.g.cmp_selected = false
          return cmp.accept({ index = 3 })
        end,
      },
      ["<A-4>"] = {
        function(cmp)
          vim.g.cmp_selected = false
          return cmp.accept({ index = 4 })
        end,
      },
      ["<A-5>"] = {
        function(cmp)
          vim.g.cmp_selected = false
          return cmp.accept({ index = 5 })
        end,
      },
      ["<A-6>"] = {
        function(cmp)
          vim.g.cmp_selected = false
          return cmp.accept({ index = 6 })
        end,
      },
      ["<A-7>"] = {
        function(cmp)
          vim.g.cmp_selected = false
          return cmp.accept({ index = 7 })
        end,
      },
      ["<A-8>"] = {
        function(cmp)
          vim.g.cmp_selected = false
          return cmp.accept({ index = 8 })
        end,
      },
      ["<A-9>"] = {
        function(cmp)
          vim.g.cmp_selected = false
          return cmp.accept({ index = 9 })
        end,
      },
      ["<A-0>"] = {
        function(cmp)
          vim.g.cmp_selected = false
          return cmp.accept({ index = 10 })
        end,
      },
    },
    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 500 },
      ghost_text = { enabled = true, show_with_menu = true },
      list = {
        selection = {
          preselect = true, -- Ghost text doesn't work without it
        },
      },
      menu = {
        auto_show = true,
        draw = {
          columns = { { "item_idx" }, { "kind_icon" }, { "label", "label_description", gap = 1 } },
          components = {
            item_idx = {
              text = function(ctx)
                return ctx.idx == 10 and "0" or ctx.idx >= 10 and " " or tostring(ctx.idx)
              end,
              highlight = "BlinkCmpItemIdx",
            },
            kind_icon = {
              text = function(ctx)
                local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                return kind_icon
              end,
              highlight = function(ctx)
                local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                return hl
              end,
            },
            kind = {
              highlight = function(ctx)
                local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                return hl
              end,
            },
          },
        },
      },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    signature = { enabled = true },
    sources = {
      default = { "lazydev", "lsp", "path", "snippets", "buffer" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
      },
    },
    cmdline = {
      keymap = { preset = "inherit" },
      completion = {
        menu = { auto_show = true },
      },
    },
  },
}

return M
