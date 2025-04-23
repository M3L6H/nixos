vim.g.mapleader = " "
vim.g.maplocalleader = " "

local km = vim.keymap

km.set("n", "<leader>x", "<CMD>close<CR>", { desc = "Close split" })
km.set("n", "<leader>X", "<CMD>only<CR>", { desc = "Close all other splits" })
km.set("n", "<leader>s", "<CMD>wa<CR>", { desc = "Save all" })
km.set("n", "<leader>q", "<CMD>wqa<CR>", { desc = "Save and quit all" })
km.set("n", "<leader>Q", "<CMD>qa!<CR>", { desc = "Quit all w/o saving" })

km.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
km.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

km.set("n", "J", "mzJ`z", { desc = "Join with next line" })

km.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down" })
km.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up" })
km.set("n", "n", "nzzzv", { desc = "Find next" })
km.set("n", "N", "Nzzzv", { desc = "Find previous" })

km.set("n", "<leader>y", "\"+y", { desc = "Yank to system clipboard" })
km.set("v", "<leader>y", "\"+y", { desc = "Yank to system clipboard" })

km.set("n", "<leader>p", "\"+p", { desc = "Paste from system clipboard" })
km.set("v", "<leader>p", "\"+p", { desc = "Paste from system clipboard" })
km.set("n", "<leader>P", "\"+P", { desc = "Paste from system clipboard" })

km.set("n", "<A-p>", "\"_dP", { desc = "Paste without overwriting register" })
km.set("v", "<A-p>", "\"_dP", { desc = "Paste without overwriting register" })
km.set("n", "<A-P>", "\"+P", { desc = "Paste without overwriting register" })

km.set("n", "<A-d>", "\"_d", { desc = "Delete into void register" })
km.set("v", "<A-d>", "\"_d", { desc = "Delete into void register" })

-- we don't like Q
km.set("n", "Q", "<nop>")

km.set("n", "<leader>ll", "<CMD>Lazy<CR>", { desc = "Open Lazy" })

km.set("n", "<leader>cf", function()
  vim.lsp.buf.format()
end, { desc = "Format file" })
