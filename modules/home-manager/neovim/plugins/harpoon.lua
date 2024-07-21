local M = {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>a", function() require("harpoon"):list():add() end },
    {
      "<leader>h",
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
    },
    { "<A-j>", function() require("harpoon"):list():select(1) end },
    { "<A-k>", function() require("harpoon"):list():select(2) end },
    { "<A-l>", function() require("harpoon"):list():select(3) end },
    { "<A-;>", function() require("harpoon"):list():select(4) end },
  },
  config = function(_, opts)
    local harpoon = require("harpoon")
    harpoon.setup(opts)
  end,
}

return M

