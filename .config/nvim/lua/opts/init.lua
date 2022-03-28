--[[
  Lua fun
  Author : tsjazil
  Email : tsjazil@gmail.com
--]]


local opt = vim.opt

opt.syntax = 'enable'

opt.hidden         = true
opt.splitbelow     = true
opt.splitright     = true
opt.smarttab       = true
opt.expandtab      = true
opt.smartindent    = true
opt.autoindent     = true
opt.termguicolors  = true 
opt.backup         = false
opt.writebackup    = false
opt.wrap           = false


vim.o.encoding     = "utf-8"
vim.o.fileencoding ="utf-8"

opt.pumheight      = 10  
opt.updatetime     = 300
opt.timeoutlen     = 500
opt.conceallevel   = 0
opt.tabstop        = 2     
opt.shiftwidth     = 2  
opt.cmdheight      = 1
opt.relativenumber = true
opt.ignorecase     = true
opt.smartcase      = true
opt.cursorline     = true
opt.title          = true
opt.hlsearch       = false 
opt.showmode       = false
opt.ruler          = false
opt.showcmd        = false
vim.o.background   = 'dark'
opt.mouse          = 'a'
vim.o.clipboard = "unnamedplus"
vim.cmd('colorscheme catppuccin')
vim.g.transparent_enabled = true --Transparency is achieved by plugin 'xiyaowong/nvim-transparent'



 -- vim.cmd('colorscheme tokyonight')
 -- vim.g.tokyonight_style = "storm"
-- vim.cmd('highlight NvimTreeVertSplit guifg=#6E6C7E')
-- vim.cmd('highlight NvimTreeNormal guibg=none')

