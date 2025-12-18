vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

--vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

-- tab
-- vim.cmd("set guitablabel=[%N] %t %M")
-- vim.cmd("set guitablabel=%t")
vim.api.nvim_cmd({cmd = "set", args = {"guitablabel=\\[%N\\]\\ %t\\ %M"}},{})

-- terminal
vim.opt.termguicolors = true

-- run :h 'shell' to see more
vim.cmd("let &shell = executable('pwsh') ? 'pwsh' : 'powershell'")
-- vim.cmd("let &shell = 'powershell'")
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

vim.filetype.add{
	extension = {
		jshader = "cpp",
		ijshader = "cpp",
		frag = "glsl",
		comp = "glsl",
		vert = "glsl",
		scriptdef = "cpp",
		def = "cpp",
		claradb = "json",
		config = "json",
		postfx = "json",
		gltf = "json",
	}
}
