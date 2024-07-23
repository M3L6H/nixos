local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufReadPost",
  opts = {
    highlight = {
      enable = true,
      disable = function(lang, buf)
        local max_filesize = 1000 * 1024 -- 10 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        return ok and stats and stats.size > max_filesize
      end,
      additional_vim_regex_highlighting = false,
    },
    autopairs = { enable = true },
    ensure_installed = {
      "bash",
      "c",
      "cpp",
      "css",
      "go",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "ruby",
      "rust",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
      "yuck",
      "zig",
    },
    indent = {
      enable = true,
    },
    sync_install = false,
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end
}

return M

