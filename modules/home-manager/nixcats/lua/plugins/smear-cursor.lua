local M = {
  "sphamba/smear-cursor.nvim",
  event = "BufEnter",
  opts = {
    stiffness = 0.8,
    trailing_stiffness = 0.5,
    distance_stop_animating = 0.5,
    legacy_computing_symbols_support = true,
    smear_insert_mode = false,
  },
}

return M
