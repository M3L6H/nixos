-- Open help in a vertical split
vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  command = "wincmd L",
  desc = "Open help in a vertical split",
})

-- Highlight text after yanking
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
  pattern = "*",
  callback = function() vim.highlight.on_yank() end,
  desc = "Highlight yank",
})
