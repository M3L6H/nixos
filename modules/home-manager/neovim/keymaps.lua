vim.g.mapleader = " "
vim.g.maplocalleader = " "

local km = vim.keymap

-- move lines in visual mode
km.set("v", "J", ":m '>+1<CR>gv=gv")
km.set("v", "K", ":m '<-2<CR>gv=gv")

-- nice join
km.set("n", "J", "mzJ`z")

-- fix paging/navigation
km.set("n", "<C-d>", "<C-d>zz")
km.set("n", "<C-u>", "<C-u>zz")
km.set("n", "n", "nzzzv")
km.set("n", "N", "Nzzzv")

-- paste without overwriting buffer
km.set("x", "<leader>p", "\"_dP")

-- yank to clipboard
km.set("n", "<leader>y", "\"+y")
km.set("v", "<leader>y", "\"+y")
km.set("n", "<leader>Y", "\"+Y")

-- delete into void register
km.set("n", "<leader>d", "\"+d")
km.set("v", "<leader>d", "\"+d")

km.set("n", "Q", "<nop>")

-- format file
km.set("n", "<leader>f", function()
  vim.lsp.buf.format()
end)

-- navigate in insert mode
km.set("i", "<A-h>", "<Left>")
km.set("i", "<A-l>", "<Right>")
km.set("i", "<A-j>", "<C-o>gj")
km.set("i", "<A-k>", "<C-o>gk")

