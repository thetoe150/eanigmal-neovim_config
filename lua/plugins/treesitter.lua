-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
-- or you can return new options to override all the defaults

return {
	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		build = ':TSUpdate',

		config = function ()
			local ts = require'nvim-treesitter'
			ts.setup {
				-- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
			}
			ts.install { 'cpp', 'c', 'lua', 'python' }

		end
	},
}
