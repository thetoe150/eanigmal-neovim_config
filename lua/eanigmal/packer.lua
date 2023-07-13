
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
	  use 'wbthomason/packer.nvim'

	  use {
		  'nvim-telescope/telescope.nvim', tag = '0.1.1',
		  -- or                            , branch = '0.1.x',
		  requires = { {'nvim-lua/plenary.nvim'} }
	}

	use({ 'rose-pine/neovim',
		as = 'rose-pine',
		config = function()
			vim.cmd('colorscheme rose-pine')
		end
	})

	use('theprimeagen/harpoon')
	use('mbbill/undotree')
	use('tpope/vim-fugitive')

    --use('nvim-treesitter/nvim-treesitter',
        --{dependencies =
          --'nvim-treesitter/nvim-treesitter-textobjects'
        --},
        --{build = ':TSUpdate'}
    --)

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

	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use 'nvim-treesitter/playground'
	-- install without yarn or npm
	use({
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	})

	use("folke/tokyonight.nvim")
	use("EdenEast/nightfox.nvim")
	use('mfussenegger/nvim-dap')

  end)
