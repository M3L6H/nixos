local M = {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {
    disable_filetype = { "oil", "snacks_picker_input" },
  },
}

return M
