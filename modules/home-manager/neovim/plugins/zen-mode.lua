local M = {
  "folke/zen-mode.nvim",
  dependencies = {
    { "folke/twilight.nvim" },
  },
  keys = {
    { "<leader>z", "<cmd>ZenMode<cr>", mode = "n", desc = "Toggle zen mode" },
  },
  opts = {
    plugins = {
      options = {
        showcmd = true,
      },
      tmux = { enabled = true },
    },
    on_open = function()
      vim.cmd("cabbrev <buffer> q let b:quitting = 1 <bar> q")
      vim.cmd("cabbrev <buffer> wq let b:quitting = 1 <bar> wq")
      vim.cmd("cabbrev <buffer> x let b:quitting = 1 <bar> x")
      vim.keymap.set("n", "ZZ", function()
        vim.b.quitting = 1
        vim.cmd("x")
      end)
      vim.keymap.set("n", "ZQ", function()
        vim.b.quitting = 1
        vim.cmd("q!")
      end)
    end,
    on_close = function()
      if vim.b.quitting == 1 then
        print("vim b quitting!")
        vim.b.qutting = 0

        if vim.v.cmdbang == 1 then
          vim.cmd("q!")
        else
          vim.cmd("wq")
        end
      end
    end
  },
  config = function(_, opts)
    require("zen-mode").setup(opts)
  end,
}

return M

