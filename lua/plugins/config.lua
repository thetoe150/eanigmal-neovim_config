-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins

return {
	{
		"nvim-telescope/telescope.nvim",
		requires = {
			{'nvim-lua/plenary.nvim'},
		},
		keys = {
		},
		opts = {
			defaults = {
				layout_strategy = "horizontal",
				layout_config = { prompt_position = "top" },
				sorting_strategy = "ascending",
				winblend = 0,
			},
		},
	},

  	{
		'mbbill/undotree'
	},

	{
		'tpope/vim-fugitive',
		keys = {
			vim.keymap.set("n", "<leader>r", vim.cmd.Git)
		}
	},

	{
		'sindrets/diffview.nvim'
	},

	{
		'navarasu/onedark.nvim'
	},

	{
		'nvim-treesitter/playground'
	},

	{
		"folke/todo-comments.nvim",
	},

	{
	"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"bash",
				"json",
				"lua",
				"markdown",
				"python",
				"regex",
				"vim",
				"yaml",
			},
		},
	},

	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{                                      -- Optional
				'williamboman/mason.nvim',
				run = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required
		}
	},

  -- or you can return new options to override all the defaults
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
	},

	-- add any tools you want to have installed below
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
			"stylua",
			"shellcheck",
			"shfmt",
			"flake8",
			},
		},
	},
}
