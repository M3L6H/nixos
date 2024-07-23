vim.g.mapleader = " "
vim.g.maplocalleader = " "

local km = vim.keymap

-- Move lines in visual mode
km.set("v", "J", ":m '>+1<CR>gv=gv")
km.set("v", "K", ":m '<-2<CR>gv=gv")

km.set("n", "J", "mzJ`z")
km.set("n", "<C-d>", "<C-d>zz")
km.set("n", "<C-u>", "<C-u>zz")
km.set("n", "n", "nzzzv")
km.set("n", "N", "Nzzzv")

-- navigate in insert mode
km.set("i", "<A-h>", "<Left>")
km.set("i", "<A-l>", "<Right>")
km.set("i", "<A-j>", "<C-o>gj")
km.set("i", "<A-k>", "<C-o>gk")

