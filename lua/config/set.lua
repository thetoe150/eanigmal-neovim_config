vim.g.mapleader = " "

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.autoindent = true
vim.opt.smartindent = false

vim.opt.wrap = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.api.nvim_cmd({cmd = "set", args = {"nofoldenable"}},{})

vim.opt.scrolloff = 2
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "96"

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
