-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
-- or you can return new options to override all the defaults
--
--
-- modified version of code from this config
--https://github.com/fredrikaverpil/dotfiles/blob/main/nvim-fredrik/lua/fredrik/plugins/core/treesitter.lua
return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate", -- Automatically update parsers on plugin update
			branch = "master",
		event = { "BufReadPost", "BufNewFile" }, -- Lazy load on file open
		opts = {
			-- A list of parser names, or "all"
			ensure_installed = { 
				"lua", "vim", "vimdoc", "markdown", "bash", "python", "json", "c", "cpp"
			},

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			auto_install = true,

			highlight = {
			enable = true, -- Enable tree-sitter syntax highlighting
			-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
			-- Set to `true` if you depend on 'syntax' being enabled (like for indent)
			additional_vim_regex_highlighting = false,
			},

			indent = {
				enable = true, -- Enable tree-sitter based indentation
			},

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		},
		config = function(_, opts)
		-- Manually call setup to apply the opts
			require("nvim-treesitter.configs").setup(opts)
		end,
	},

  --{
  --  "nvim-treesitter/nvim-treesitter-context",
  --  event = "BufRead",
  --  dependencies = {
  --    "nvim-treesitter/nvim-treesitter",
  --    event = "BufRead",
  --  },
  --  opts = {
  --    multiwindow = true,
  --  },
  --},
}
