-- Taken from https://github.com/BirdeeHub/nixCats-nvim/blob/main/templates/LazyVim/init.lua

local utils = require('nixCatsUtils')

-- Set up a default value for when we are not in the Nix world
utils.setup {
  non_nix_value = true,
}

-- If in the Nix world, keep the lockfile in the NixOS config so it can remain
-- checked into source contro
local function getlockfilepath()
  if utils.isNixCats and type(nixCats.settings.unwrappedCfgPath) == 'string' then
    return nixCats.settings.unwrappedCfgPath .. '/lazy-lock.json'
  else
    return vim.fn.stdpath 'config' .. '/lazy-lock.json'
  end
end

local lazyOptions = {
  defaults = {
    lazy = true,
  },
  lockfile = getlockfilepath(),
  install = {
    -- Don't install plugins in a Nix environment
    missing = utils.lazyAdd(true, false),
    colorscheme = { "cyberdream" },
  },
  checker = {
    -- Don't check for updates in a Nix environment
    enabled = utils.lazyAdd(true, false),
  },
}

-- Lazy wrapper which uses the nixCats version in a nix environment
require('nixCatsUtils.lazyCat').setup(nixCats.pawsible { 'allPlugins', 'start', 'lazy.nvim' }, {
  -- TODO: Move this to its own plugin file
  {
    'nvim-treesitter/nvim-treesitter',
    build = utils.lazyAdd ':TSUpdate',
    opts_extend = utils.lazyAdd(nil, false),
    opts = {
      -- nix already ensured they were installed, and we would need to change the parser_install_dir if we wanted to use it instead.
      -- so we just disable install and do it via nix.
      ensure_installed = utils.lazyAdd({ 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc' }, false),
      auto_install = utils.lazyAdd(true, false),
    },
  },
  { import = 'plugins' },
}, lazyOptions)

