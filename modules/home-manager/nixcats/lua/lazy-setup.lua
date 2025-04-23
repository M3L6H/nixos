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

-- Colorscheme
vim.g.colorscheme = utils.lazyAdd("kanagawa", nixCats.settings.colorscheme)

local lazyOptions = {
  defaults = {
    lazy = true,
  },
  lockfile = getlockfilepath(),
  install = {
    -- Don't install plugins in a Nix environment
    missing = utils.lazyAdd(true, false),
    colorscheme = { vim.g.colorscheme },
  },
  ui = {
    border = vim.g.border,
  },
  checker = {
    -- Don't check for updates in a Nix environment
    enabled = utils.lazyAdd(true, false),
  },
}

-- Lazy wrapper which uses the nixCats version in a nix environment
require('nixCatsUtils.lazyCat').setup(nixCats.pawsible { 'allPlugins', 'start', 'lazy.nvim' }, {
  { import = 'plugins' },
}, lazyOptions)

