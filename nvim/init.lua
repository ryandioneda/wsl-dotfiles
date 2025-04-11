vim.g.mapleader = ' '


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
    end

vim.opt.rtp:prepend(lazypath)

-- Add dotfiles/nvim/lua to Lua's search path
local dotfiles_nvim_path = "~/dotfiles/nvim/lua/?.lua"
local dotfiles_nvim_init_path = "~/dotfiles/nvim/lua/init.lua"
package.path = package.path .. ";" .. vim.fn.expand(dotfiles_nvim_path) .. ";" .. vim.fn.expand(dotfiles_nvim_init_path)


local opts = {}
local plugins = {
    {   
        "zootedb0t/citruszest.nvim",
        lazy = false,
        priority = 1000, 
    },
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.8",
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "nvim-treesitter/nvim-treesitter", build= ":TSUpdate"
    },
    {
        "nvim-tree/nvim-tree.lua",
        lazy = true,
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        }

    },
}

require("lazy").setup(plugins, opts)


-- THEME --
vim.cmd.colorscheme "citruszest"


-- TELESCOPE --
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})


-- TREESITTER --
local config = require("nvim-treesitter.configs")

config.setup({
    --parsers--
    ensure_installed = {"lua", "javascript"},
    highlight = { enable = true },
    indent = { enable = true }
})

-- FILE TREE --
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-- Yank to clipboard using xclip
vim.api.nvim_set_keymap('v', '<Leader>y', ':w !xclip -selection clipboard<CR>', { noremap = true, silent = true })

-- Paste from clipboard using xclip
vim.api.nvim_set_keymap('n', '<Leader>p', ':r !xclip -selection clipboard -o<CR>', { noremap = true, silent = true })

require("core.keymaps")
require("core.settings")
