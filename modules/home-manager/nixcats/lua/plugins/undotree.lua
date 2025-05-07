local M = {
  "mbbill/undotree",
  keys = {
    {
      "<leader>u",
      function()
        vim.cmd.UndotreeToggle()
        vim.cmd.wincmd("h")
      end,
      desc = "Toggle undotree",
    },
  },
}

return M
