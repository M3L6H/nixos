vim.g.mapleader = " "
vim.g.maplocalleader = " "

local km = vim.keymap

km.set("n", "<leader>x", "<CMD>close<CR>", { desc = "Close split" })
km.set("n", "<leader>X", "<CMD>only<CR>", { desc = "Close all other splits" })

local function switch_window()
  if vim.fn.exists("$TMUX") and vim.g.terminalwindow ~= nil then
    -- Switch to terminal window if in tmux session
    os.execute("tmux select-window -t " .. vim.g.terminalwindow)
    return true
  end
  return false
end

local function close_all()
  -- Close all buffers
  vim.cmd("bufdo! bwipeout!")

  -- If we are not a neovim-remote server or not in tmux
  if vim.v.servername ~= "/tmp/nvimsocket" or not switch_window() then
    -- Quit vim
    vim.cmd("q")
  else
    -- Return to dashboard otherwise
    -- Open in current window. Weird things happen if we let Snacks make a new window
    Snacks.dashboard({ win = vim.api.nvim_get_current_win() })
  end
end

km.set("n", "<leader>s", "<CMD>wa<CR>", { desc = "Save all" })
km.set(
  "n",
  "<leader>S",
  function()
    vim.cmd("wa") -- Save all
    switch_window()
  end,
  { desc = "Save all and switch to terminal" }
)
km.set(
  "n",
  "<leader>q",
  function()
    vim.cmd("wa") -- Save all
    close_all()
  end,
  { desc = "Save and quit all" }
)
km.set("n", "<leader>Q", close_all, { desc = "Quit all w/o saving" })

km.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
km.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

km.set("n", "J", "mzJ`z", { desc = "Join with next line" })

-- km.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down" })
-- km.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up" })
-- km.set("n", "n", "nzzzv", { desc = "Find next" })
-- km.set("n", "N", "Nzzzv", { desc = "Find previous" })

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
