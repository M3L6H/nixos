local image = vim.g.dashboard.image
local size = vim.g.dashboard.size
local dims = {}
for dim in string.gmatch(size, "%d+") do
  table.insert(dims, dim)
end
local height = tonumber(dims[2])

local M = {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart find files" },
    -- Find
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find files" },
    { "<leader>fd", function() Snacks.picker.diagnostics() end, desc = "Find diagnostics" },
    { "<leader>fh", function() Snacks.picker.help() end, desc = "Find help" },
    { "<leader>fn", function() Snacks.picker.notifications() end, desc = "Find notifications" },
    { "<leader>fs", function() Snacks.picker.grep() end, desc = "Grep files" },
    -- Code
    { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename file" },
    -- Goto
    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto definition" },
    { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto declaration" },
    { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto implementation" },
    { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto t[y]pe definition" },
    -- Jump
    {
      "]]",
      function() Snacks.words.jump(vim.v.count1) end,
      desc = "Jump to next reference",
      mode = { "n", "t" },
    },
    {
      "[[",
      function() Snacks.words.jump(-vim.v.count1) end,
      desc = "Jump to previous reference",
      mode = { "n", "t" },
    },
  },
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      sections = {
        {
          section = "terminal",
          cmd = "chafa " .. image .. " --format symbols --symbols vhalf --size " .. size .. " --stretch --align center; sleep .1",
          height = height,
          padding = 1,
        },
        {
          pane = 2,
          { section = "header", },
          { section = "keys", gap = 1, padding = 1 },
          {
            icon = " ",
            title = "Recent Files",
            section = "recent_files",
            indent = 2,
            padding = 1,
            limit = 8,
          },
          {
            icon = " ",
            title = "Git Status",
            section = "terminal",
            enabled = function()
              return Snacks.git.get_root() ~= nil
            end,
            cmd = "git status --short --branch --renames",
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          },
          { section = "startup", },
        },
      },
    },
    image = { enabled = true },
    indent = {
      enabled = true,
      indent = {
        only_scope = true,
        only_current = true,
      },
      scope = {
        only_current = true,
      },
    },
    input = { enabled = true },
    notifier = {
      enabled = true,
      level = vim.log.levels.INFO,
    },
    quickfile = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
}

return M
