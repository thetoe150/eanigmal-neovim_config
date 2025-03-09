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

	{
		'stevearc/oil.nvim',
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		-- dependencies = { { "echasnovski/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
		config = function ()
			require("oil").setup({
				-- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
				-- Set to false if you want some other plugin (e.g. netrw) to open when you edit directories.
				default_file_explorer = true,
				-- Id is automatically added at the beginning, and name at the end
				-- See :help oil-columns
				columns = {
					"icon",
					-- "permissions",
					-- "size",
					-- "mtime",
				},
				-- Buffer-local options to use for oil buffers
				buf_options = {
					buflisted = false,
					bufhidden = "hide",
				},
				-- Window-local options to use for oil buffers
				win_options = {
					wrap = false,
					signcolumn = "no",
					cursorcolumn = false,
					foldcolumn = "0",
					spell = false,
					list = false,
					conceallevel = 3,
					concealcursor = "nvic",
				},
				-- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
				delete_to_trash = false,
				-- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
				skip_confirm_for_simple_edits = false,
				-- Selecting a new/moved/renamed file or directory will prompt you to save changes first
				-- (:help prompt_save_on_select_new_entry)
				prompt_save_on_select_new_entry = true,
				-- Oil will automatically delete hidden buffers after this delay
				-- You can set the delay to false to disable cleanup entirely
				-- Note that the cleanup process only starts when none of the oil buffers are currently displayed
				cleanup_delay_ms = 2000,
				lsp_file_methods = {
				-- Enable or disable LSP file operations
				enabled = true,
				-- Time to wait for LSP file operations to complete before skipping
				timeout_ms = 1000,
				-- Set to true to autosave buffers that are updated with LSP willRenameFiles
				-- Set to "unmodified" to only save unmodified buffers
				autosave_changes = false,
				},
				-- Constrain the cursor to the editable parts of the oil buffer
				-- Set to `false` to disable, or "name" to keep it on the file names
				constrain_cursor = "editable",
				-- Set to true to watch the filesystem for changes and reload oil
				watch_for_changes = false,
				-- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
				-- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
				-- Additionally, if it is a string that matches "actions.<name>",
				-- it will use the mapping at require("oil.actions").<name>
				-- Set to `false` to remove a keymap
				-- See :help oil-actions for a list of all available actions
				keymaps = {
					["g?"] = { "actions.show_help", mode = "n" },
					["l"] = {"actions.select", mode = "n"},
					["h"] = { "actions.parent", mode = "n" },
					["<C-s>"] = { "actions.select", opts = { vertical = true } },
					["<C-h>"] = { "actions.select", opts = { horizontal = true } },
					["<C-t>"] = { "actions.select", opts = { tab = true } },
					["<C-p>"] = "actions.preview",
					["<C-c>"] = { "actions.close", mode = "n" },
					["<C-l>"] = "actions.refresh",
					["_"] = { "actions.open_cwd", mode = "n" },
					["`"] = { "actions.cd", mode = "n" },
					["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
					["gs"] = { "actions.change_sort", mode = "n" },
					["gx"] = "actions.open_external",
					["g."] = { "actions.toggle_hidden", mode = "n" },
					["g\\"] = { "actions.toggle_trash", mode = "n" },
				},
				-- Set to false to disable all of the above keymaps
				use_default_keymaps = true,
				view_options = {
					-- Show files and directories that start with "."
					show_hidden = true,
					-- This function defines what is considered a "hidden" file
					is_hidden_file = function(name, bufnr)
					local m = name:match("^%.")
					return m ~= nil
					end,
					-- This function defines what will never be shown, even when `show_hidden` is set
					is_always_hidden = function(name, bufnr)
					return false
					end,
					-- Sort file names with numbers in a more intuitive order for humans.
					-- Can be "fast", true, or false. "fast" will turn it off for large directories.
					natural_order = "fast",
					-- Sort file and directory names case insensitive
					case_insensitive = false,
					sort = {
					-- sort order can be "asc" or "desc"
					-- see :help oil-columns to see which columns are sortable
					{ "type", "asc" },
					{ "name", "asc" },
					},
					-- Customize the highlight group for the file name
					highlight_filename = function(entry, is_hidden, is_link_target, is_link_orphan)
						return nil
					end,
				},
				-- Extra arguments to pass to SCP when moving/copying files over SSH
				extra_scp_args = {},
				-- EXPERIMENTAL support for performing file operations with git
				git = {
					-- Return true to automatically git add/mv/rm files
					add = function(path)
					return false
					end,
					mv = function(src_path, dest_path)
					return false
					end,
					rm = function(path)
					return false
					end,
				},
				-- Configuration for the floating window in oil.open_float
				float = {
					-- Padding around the floating window
					padding = 2,
					max_width = 0,
					max_height = 0,
					border = "rounded",
					win_options = {
					winblend = 0,
				},
				-- optionally override the oil buffers window title with custom function: fun(winid: integer): string
				get_win_title = nil,
				-- preview_split: Split direction: "auto", "left", "right", "above", "below".
				preview_split = "auto",
				-- This is the config that will be passed to nvim_open_win.
				-- Change values here to customize the layout
				override = function(conf)
					return conf
				end,
				},
				-- Configuration for the file preview window
				preview_win = {
					-- Whether the preview window is automatically updated when the cursor is moved
					update_on_cursor_moved = true,
					-- How to open the preview window "load"|"scratch"|"fast_scratch"
					preview_method = "fast_scratch",
					-- A function that returns true to disable preview on a file e.g. to avoid lag
					disable_preview = function(filename)
						return false
					end,
					-- Window-local options to use for preview window buffers
					win_options = {},
				},
				-- Configuration for the floating action confirmation window
				confirmation = {
					-- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
					-- min_width and max_width can be a single value or a list of mixed integer/float types.
					-- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
					max_width = 0.9,
					-- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
					min_width = { 40, 0.4 },
					-- optionally define an integer/float for the exact width of the preview window
					width = nil,
					-- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
					-- min_height and max_height can be a single value or a list of mixed integer/float types.
					-- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
					max_height = 0.9,
					-- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
					min_height = { 5, 0.1 },
					-- optionally define an integer/float for the exact height of the preview window
					height = nil,
					border = "rounded",
					win_options = {
						winblend = 0,
					},
				},
				-- Configuration for the floating progress window
				progress = {
					max_width = 0.9,
					min_width = { 40, 0.4 },
					width = nil,
					max_height = { 10, 0.9 },
					min_height = { 5, 0.1 },
					height = nil,
					border = "rounded",
					minimized_border = "none",
					win_options = {
						winblend = 0,
					},
				},
				-- Configuration for the floating SSH window
				ssh = {
					border = "rounded",
				},
				-- Configuration for the floating keymaps help window
				keymaps_help = {
					border = "rounded",
					},
				})
		end
	},
}
