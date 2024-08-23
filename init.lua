vim.g.mapleader = ","
opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.wrap = false
opt.cursorline = true
opt.colorcolumn = "120"

opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.shiftround = true
opt.expandtab = true

opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true
opt.showmode = false

require("pluginmanager")
require("config")
require("maps")
