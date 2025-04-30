local image = vim.g.dashboard.image
local size = vim.g.dashboard.size
local dims = {}
for dim in string.gmatch(size, "%d+") do
  table.insert(dims, dim)
end

---@class (exact) Block
---@field min integer
---@field max integer

---@class (exact) Desc
---@field enabled boolean
---@field height integer

---@param height integer Height we have to work with
---@param blocks Block[] Array of blocks that we need to fit
---@return Desc[]
local function get_heights(height, blocks)
  local res = {}
  local sum = 0

  for _, block in ipairs(blocks) do
    if sum + block.min <= height then
      sum = sum + block.min
      table.insert(res, { enabled = true, height = block.min })
    else
      table.insert(res, { enabled = false, height = 0 })
    end
  end

  for i, block in ipairs(blocks) do
    if sum < height then
      local diff = math.min(height - sum, block.max - block.min)
      res[i].height = res[i].height + diff
      sum = sum + diff
    end
  end

  return res
end

local max_height = 40
local base_height = 2
local height = math.min(max_height, tonumber(dims[2]))
local heights = get_heights(height - max_height + 17, {
  { min = base_height + 3, max = base_height + 8 },
  { min = base_height + 2, max = base_height + 5 },
})

local recents = heights[1]
local git = heights[2]

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
            enabled = recents.enabled,
            indent = 2,
            padding = 1,
            limit = recents.height - base_height,
          },
          {
            icon = " ",
            title = "Git Status",
            section = "terminal",
            enabled = function()
              return git.enabled and Snacks.git.get_root() ~= nil
            end,
            cmd = "git status --short --branch --renames",
            height = git.height - base_height,
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
