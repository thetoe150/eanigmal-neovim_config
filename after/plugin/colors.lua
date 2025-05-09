-- color = color or "rose-pine"
require('onedark').setup  {
	-- Main options --
	style = 'deep', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
	transparent = false,  -- Show/hide background
	term_colors = true, -- Change terminal color as per the selected theme style
	ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
	cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

	-- toggle theme style ---
	toggle_style_key = '<leader>cl', -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
	-- toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between
	toggle_style_list = {'light', 'darker', 'deep'}, -- List of styles to toggle between

	-- Change code style ---
	-- Options are italic, bold, underline, none
	-- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
	code_style = {
		comments = 'none',
		keywords = 'bold',
		functions = 'none',
		strings = 'none',
		variables = 'none'
	},

	-- Lualine options --
	lualine = {
		transparent = false, -- lualine center bar transparency
	},

	colors = {
		-- bright_orange = "#ff8800",    -- define a new color
		-- green = '#00ffaa',            -- redefine an existing color
  },-- Custom Highlights --
	highlights = {
		--:h treesitter-highlight-group
		['@comment'] = {fg = "#008000"},
		-- ["@string"] = {fg = '$bright_orange', bg = '#00ff00', fmt = 'bold'},
		-- ["@function"] = {fg = '#0000ff', sp = '$cyan', fmt = 'underline,italic'},
		-- ["@function.builtin"] = {fg = '#0059ff'}
	}, -- Override highlight groups

	-- Plugins Config --
	-- diagnostics = {
	--     darker = true, -- darker colors for diagnostic
	--     undercurl = true,   -- use undercurl instead of underline for diagnostics
	--     background = true,    -- use background color for virtual text
	-- },
}

require('onedark').load()
-- color = color or "onedark"
-- vim.cmd.colorscheme(color)

vim.api.nvim_set_hl(0, "Normal", { bg = "none"  })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"  })
-- vim.api.nvim_set_hl(0, "@comment", {fg = "#008000"})

-- ColorMyPencils()
