local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		requires = {
			{'nvim-lua/plenary.nvim'},
		}
	}

	use('mbbill/undotree')
	use('tpope/vim-fugitive')
	use('sindrets/diffview.nvim')

    -- use('nvim-treesitter/nvim-treesitter',
      --{dependencies =
        --'nvim-treesitter/nvim-treesitter-textobjects'
      --},
      --{build = ':TSUpdate'}rror executing lua [string ":source (no file)"]:5: module 'packer' not found:
    -- )

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

	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use 'nvim-treesitter/playground'
	-- install without yarn or npm
	use({
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	})

	-- debug
	-- use('mfussenegger/nvim-dap')

	use({
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" }
	})

	-- color scheme
	use({"folke/tokyonight.nvim",
		as = "tokyonight",
		config = function()
			vim.cmd('colorscheme tokyonight-night')
		end
	})
	use("EdenEast/nightfox.nvim")
	use({ 'rose-pine/neovim'})
	use'navarasu/onedark.nvim'
	  -- Automatically set up your configuration after cloning packer.nvim
	  -- Put this at the end after all plugins

	use('rbong/vim-flog')

	-- use('alec-gibson/nvim-tetris')

	  if packer_bootstrap then
		require('packer').sync()
	  end
  end)
  
