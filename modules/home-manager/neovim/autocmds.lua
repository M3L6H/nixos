-- open zen mode immediately
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local zenmode = require("zen-mode")

    if zenmode then
      zenmode.open()
    end
  end,
})

