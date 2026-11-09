-- Leader key (used for your own shortcuts later)
vim.g.mapleader = " "

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Basic options
local o = vim.opt
o.number = true          -- show line numbers
o.relativenumber = true  -- numbers relative to the cursor line
o.expandtab = true       -- Tab key inserts spaces
o.tabstop = 2            -- a tab character displays as 2 columns
o.shiftwidth = 2         -- indent by 2 spaces
o.softtabstop = 2
o.smartindent = true     -- auto-indent new lines
o.termguicolors = true   -- full color support
o.mouse = "a"
o.ignorecase = true      -- search ignores case...
o.smartcase = true       -- ...unless you type a capital letter
o.cursorline = true
o.scrolloff = 8          -- keep 8 lines visible above/below the cursor
o.signcolumn = "yes"     -- reserve space on the left for diagnostics/git icons
o.undofile = true        -- keep undo history after closing a file
o.showmode = false       -- the status line already shows the mode

-- Ignore optional providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0

-- Plugins (installed automatically on first launch)
vim.pack.add({
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-lualine/lualine.nvim",
})

-- Theme: Catppuccin Mocha, transparent background
require("catppuccin").setup({
  flavour = "mocha",
  transparent_background = true,
})
vim.cmd.colorscheme("catppuccin")

-- Status line
require("lualine").setup({
  options = { theme = "catppuccin" },
})
