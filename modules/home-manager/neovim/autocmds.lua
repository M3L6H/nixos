-- save when exiting insert mode
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.cmd("w")
  end,
})

