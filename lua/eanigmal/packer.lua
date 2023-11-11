
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		  'nvim-telescope/telescope.nvim', tag = '0.1.4',
		  requires = { {'nvim-lua/plenary.nvim'} }
	}

	use('mbbill/undotree')
	use('tpope/vim-fugitive')

	-- lsp
    use {
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
}

    use('nvim-treesitter/nvim-treesitter',
     {dependencies =
		'nvim-treesitter/nvim-treesitter-textobjects'
     },
     {build = ':TSUpdate'}
    )

	use 'nvim-treesitter/playground'
	-- install without yarn or npm
	use({
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	})

	-- debug
	use('mfussenegger/nvim-dap')

	-- theme
	use({"folke/tokyonight.nvim",
		as = "tokyonight",
		config = function()
			vim.cmd('colorscheme tokyonight-night')
		end
	})
	use({
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" }
	})
	-- use("EdenEast/nightfox.nvim")
	-- use({ 'rose-pine/neovim'})

  end)
