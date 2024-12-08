-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins

return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
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
		'tpope/vim-fugitive'
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

	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
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
		},
		config = function()
			local lsp = require("lsp-zero")
			lsp.on_attach(function(client, bufnr)
				local opts = {buffer = bufnr, remap = false}

				vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
				vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
				vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
				vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
				vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
				vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
				vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
				vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
				vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
				vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
			end)

			lsp.preset("recommended")

			-- Fix Undefined global 'vim'
			lsp.nvim_workspace()

			local cmp = require('cmp')
			local cmp_select = {behavior = cmp.SelectBehavior.Select}
			local cmp_mappings = lsp.defaults.cmp_mappings({
			  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
			  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
			  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
			  ["<C-Space>"] = cmp.mapping.complete(),
			})

			cmp_mappings['<Tab>'] = nil
			cmp_mappings['<S-Tab>'] = nil

			lsp.setup_nvim_cmp({
			  mapping = cmp_mappings
			})

			lsp.set_preferences({
				suggest_lsp_servers = false,
				sign_icons = {
					error = 'E',
					warn = 'W',
					hint = 'H',
					info = 'I'
				}
			})

			lsp.setup()

			vim.diagnostic.config({
				virtual_text = true
			})
		end,
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

	{
		"folke/todo-comments.nvim",
		config = function()
			require("todo-comments").setup{
				signs = false, -- show icons in the signs column
				sign_priority = 8, -- sign priority
				colors = {
					error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
					warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
					info = { "DiagnosticInfo", "#006400" },
					hint = { "DiagnosticHint", "#10B981" },
					default = { "Identifier", "#7C3AED" },
					test = { "Identifier", "#FF00FF" },
				},
				keywords = {
					FIX = {
						icon = " ", -- icon used for the sign, and in search results
						color = "#AA0000", -- can be a hex color, or a named color (see below)
						alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
						-- signs = false, -- configure signs for some keywords individually
					},
					TODO = { icon = "T", color = "#209420" },
					NOTE = { icon = " ", color = "#209420", alt = { "INFO" } },
					HACK = { icon = " ", color = "#BBBB33" },
					WARN = { icon = "W", color = "#BBBB33", alt = { "WARNING", "XXX" } },
					PERF = { icon = "P ", color = "#9400D3", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
					TEST = { icon = "⏲ ", color = "#9400D3", alt = { "TESTING", "PASSED", "FAILED", "DAMN" } },
				},
				gui_style = {
					fg = "NONE", -- The gui style to use for the fg highlight group.
					bg = "BOLD", -- The gui style to use for the bg highlight group.
				},
				merge_keywords = true, -- when true, custom keywords will be merged with the defaults
				-- highlighting of the line containing the todo comment
				-- * before: highlights before the keyword (typically comment characters)
				-- * keyword: highlights of the keyword
				-- * after: highlights after the keyword (todo text)
				highlight = {
					multiline = true, -- enable multine todo comments
					multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
					multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
					before = "", -- "fg" or "bg" or empty
					keyword = "fg", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
					after = "fg", -- "fg" or "bg" or empty
					pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
					comments_only = true, -- uses treesitter to match keywords in comments only
					max_line_len = 400, -- ignore lines longer than this
					exclude = {}, -- list of file types to exclude highlighting
				},
				search = {
					command = "rg",
					args = {
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
					},
					-- regex that will be used to match keywords.
					-- don't replace the (KEYWORDS) placeholder
					pattern = [[\b(KEYWORDS):]], -- ripgrep regex
					-- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
				},
			}
		end,
	},

	{
		"LunarVim/bigfile.nvim",

		config = function ()
			require("bigfile").setup {
				filesize = 2, -- size of the file in MiB, the plugin round file sizes to the closest MiB
				pattern = { "*" }, -- autocmd pattern or function see <### Overriding the detection of big files>
				features = { -- features to disable
					"indent_blankline",
					"illuminate",
					"lsp",
					"treesitter",
					"syntax",
					"matchparen",
					"vimopts",
					"filetype",
				},
				}
				-- require("bigfile").setup {
				--   -- detect long python files
				--   pattern = function(bufnr, filesize_mib)
				--     -- you can't use `nvim_buf_line_count` because this runs on BufReadPre
				--     local file_contents = vim.fn.readfile(vim.api.nvim_buf_get_name(bufnr))
				--     local file_length = #file_contents
				--     local filetype = vim.filetype.match({ buf = bufnr })
				--     if file_length > 5000 and filetype == "python" then
				--       return true
				--     end
				--   end
				-- }
		end,
			
	},

	{
		"rbong/vim-flog"
	},
}
