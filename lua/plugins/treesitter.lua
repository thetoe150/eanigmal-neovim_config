-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
-- or you can return new options to override all the defaults

return {
	{
		'nvim-treesitter/playground'
	},

	{
		"nvim-treesitter/nvim-treesitter",
		config = function ()
			require'nvim-treesitter.configs'.setup {
				ensure_installed = { "c", "cpp", "lua", "python", "vim", "vimdoc", "query", "markdown" },
				sync_install = false,
				auto_install = true,
				ignore_install = { "javascript" },
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
				},
				-- vim.api.nvim_set_hl(0, "@comment", {fg="#008000"}),
			}
		end
	},
}
