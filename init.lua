-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = false

-- [[ Setting options ]]
-- See `:help vim.opt`
--  For more options, you can see `:help option-list`

vim.opt.virtualedit = "onemore" -- Allow cursor beyond last character

vim.opt.timeout = false
vim.opt.ttimeout = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.clipboard = "unnamedplus" -- Sync clipboard between OS and Neovim.

vim.opt.swapfile = false
vim.opt.undofile = true -- Save undo history

-- UI
vim.opt.background = "dark"

vim.opt.tabpagemax = 15       -- Show only 15 tabs
vim.opt.showmode = false      -- Don"t show the mode, since it"s already in status line

vim.opt.colorcolumn = "121"   -- Highlight column
vim.opt.cursorline = true     -- Highlight current line

vim.opt.number = true         -- Display line numbers
vim.opt.relativenumber = true -- Display relative line numbers
vim.opt.showmatch = true      -- Show matching brackets/parenthesis
vim.opt.hlsearch = true       -- Highlight search terms
vim.opt.incsearch = true      -- Find as you type search
vim.opt.ignorecase = true     -- Case insesitive search
vim.opt.smartcase = true      -- Case sensitive when uc present
vim.opt.scrolloff = 10        -- Minimal number of screen lines to keep above and below the cursor
vim.opt.foldenable = false    -- Disable code folding

vim.opt.list = true
vim.opt.listchars = { tab = "› ", trail = "•", nbsp = "." }

vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function ()
    vim.opt_local.listchars = { tab = "  ", trail = "•", nbsp = "." }
  end
})

vim.opt.splitright = true -- Puts new vsplit windows to the right of the current
vim.opt.splitbelow = true -- Puts new split windows to the bottom of the current

-- Formatting
vim.opt.wrap = true           -- Wrap long lines
vim.opt.linebreak = true      -- Wrap lines at convenient points
vim.opt.autoindent = true     -- Indent at the same level of previous line
vim.opt.shiftwidth = 4        -- Use indents of 4 spaces
vim.opt.expandtab = true      -- Tabs are spaces
vim.opt.tabstop = 4           -- An indentation every four columns
vim.opt.softtabstop = 4       -- Let backspace delete indent
vim.opt.smartindent = true    -- Automatically inserts one extra level of indentation in some cases

-- Languages
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"lua", "javascript", "typescript"},
  callback = function ()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
  end
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

require("lazy").setup("plugins", {
  ui = {
    -- If you have a Nerd Font, set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
})

-- [[ Keyconfig ]]
require("keyconfig")
