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

-- yank to clipboard
km.set("n", "<leader>y", "\"+y")
km.set("v", "<leader>y", "\"+y")
km.set("n", "<leader>Y", "\"+Y")

-- paste from clipboard
km.set("n", "<leader>p", "\"+p")
km.set("v", "<leader>p", "\"+p")
km.set("n", "<leader>P", "\"+P")

-- paste without overwriting buffer
km.set("n", "<A-p>", "\"_dP")
km.set("v", "<A-p>", "\"_dP")
km.set("n", "<A-P>", "\"+P")

-- delete into void register
km.set("n", "<A-d>", "\"_d")
km.set("v", "<A-d>", "\"_d")

-- we don't like Q
km.set("n", "Q", "<nop>")

-- format file
km.set("n", "<leader>cf", function()
  vim.lsp.buf.format()
end)

-- navigate in insert mode
km.set("i", "<A-h>", "<Left>")
km.set("i", "<A-l>", "<Right>")
km.set("i", "<A-j>", "<C-o>gj")
km.set("i", "<A-k>", "<C-o>gk")
