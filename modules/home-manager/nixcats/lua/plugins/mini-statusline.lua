local M = {
  "echasnovski/mini.statusline",
  lazy = false,
  dependencies = {
    { "echasnovski/mini.diff" },
  },
  opts = {
    content = {
      active = function()
        local MiniStatusline = require("mini.statusline")

        local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 999 }) -- Always truncate
        local git = MiniStatusline.section_git({ trunc_width = 40 })
        local diff = MiniStatusline.section_diff({ trunc_width = 75 })
        local diagnostics = MiniStatusline.section_diagnostics({
          trunc_width = 75,
          signs = {
            ERROR = "",
            WARN = "",
            INFO = "",
            HINT = "",
          },
        })
        local lsp = MiniStatusline.section_lsp({
          trunc_width = 75,
          icon = "",
        })
        local filename = MiniStatusline.section_filename({ trunc_width = 999 }) -- Always truncate
        local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 75 })
        local location = MiniStatusline.section_location({ trunc_width = 75 })
        local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

        return MiniStatusline.combine_groups({
          { hl = mode_hl, strings = { mode } },
          { hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics, lsp } },
          "%<", -- Mark general truncate point
          { hl = "MiniStatuslineFilename", strings = { filename } },
          "%=", -- End left alignment
          { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
          { hl = mode_hl, strings = { search, location } },
        })
      end,
    },
  },
  init = function()
    vim.cmd("hi clear MiniStatuslineFilename") -- Transparent statusline
  end,
}

return M
