vim.g.mapleader = " "
vim.g.maplocalleader = " "

local km = vim.keymap

-- save with <leader>s
km.set("n", "<leader>s", "<CMD>wa<CR>");
km.set("n", "<leader>q", "<CMD>wqa<CR>");
km.set("n", "<leader>Q", "<CMD>q!<CR>");

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

-- paste from clipboard
km.set("n", "<leader>p", "\"+p")
km.set("v", "<leader>p", "\"+p")
km.set("n", "<leader>P", "\"+P")

-- delete into void register
km.set("n", "<leader>d", "\"+d")
km.set("v", "<leader>d", "\"+d")

-- we don't like q
km.set("n", "Q", "<nop>")
km.set("n", "q", "<nop>")

-- format file
km.set("n", "<leader>F", function()
  vim.lsp.buf.format()
end)

-- navigate in insert mode
km.set("i", "<A-h>", "<Left>")
km.set("i", "<A-l>", "<Right>")
km.set("i", "<A-j>", "<C-o>gj")
km.set("i", "<A-k>", "<C-o>gk")

