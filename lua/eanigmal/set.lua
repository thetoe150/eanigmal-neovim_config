vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

--vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = true
vim.opt.incsearch = true

-- terminal
vim.opt.termguicolors = true
vim.cmd("set shell=powershell")
vim.cmd("set shellcmdflag=-command")
vim.cmd("set shellquote=\"")
vim.cmd("set shellxquote=")
-- let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command '
-- let &shellquote   = ''
-- let &shellpipe    = '| Out-File -Encoding UTF8 %s'
-- let &shellredir   = '| Out-File -Encoding UTF8 %s'

-- fold
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.api.nvim_cmd({cmd = "set", args = {"nofoldenable"}},{})

vim.opt.scrolloff = 2
vim.opt.signcolumn = "yes"

vim.opt.colorcolumn = "96"


vim.g.mapleader = " "

