local M = {
  "stevearc/oil.nvim",
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  lazy = false,
  keys = {
    { "-", "<cmd>Oil --float --preview<cr>", mode = "n", desc = "Open parent directory" },
  },
  opts = {
    columns = {
      "icon",
    },
    skip_confirm_for_simple_edits = true,
    lsp_file_methods = {
      autosave_changes = true,
    },
    keymaps = {
      ["<C-h>"] = false, -- We use this keymap in vim-tmux-navigator
      ["<C-l>"] = false, -- We use this keymap in vim-tmux-navigator
      ["q"] = { "actions.close", mode = "n" },
    },
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, _)
        return name == ".git" or name == ".."
      end,
    },
    float = {
      border = vim.g.border,
      preview_split = "right",
    },
    confirmation = {
      border = vim.g.border,
    },
    progress = {
      border = vim.g.border,
    },
    ssh = {
      border = vim.g.border,
    },
    keymaps_help = {
      border = vim.g.border,
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "OilEnter",
      callback = vim.schedule_wrap(function(args)
        local oil = require("oil")
        if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
          oil.open_preview()
        end
      end),
      desc = "Open preview on oil enter",
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "OilActionsPost",
      callback = function(event)
        if Snacks ~= nil and event.data.actions.type == "move" then
          Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
        end
      end,
      desc = "Notify lsp on rename using Snacks.nvim",
    })
  end,
}

return M
