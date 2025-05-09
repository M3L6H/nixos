local M = {
  "echasnovski/mini.surround",
  keys = {
    { "Sa", mode = { "n", "v" }, desc = "Surround add" },
    { "Sd", mode = { "n", "v" }, desc = "Surround delete" },
    { "Sf", desc = "Surround find" },
    { "SF", desc = "Surround find back" },
    { "Sr", desc = "Surround replace" },
  },
  opts = {
    mappings = {
      add = "Sa", -- Add surrounding in Normal and Visual modes
      delete = "Sd", -- Delete surrounding
      find = "Sf", -- Find surrounding (to the right)
      find_left = "SF", -- Find surrounding (to the left)
      highlight = "", -- Highlight surrounding
      replace = "Sr", -- Replace surrounding
      update_n_lines = "", -- Update `n_lines`

      suffix_last = "N", -- Suffix to search with "prev" method
      suffix_next = "n", -- Suffix to search with "next" method
    },
  },
}

return M