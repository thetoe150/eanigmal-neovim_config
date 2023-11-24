
function ColorMyPencils(color)
	-- color = color or "rose-pine"
	color = color or "onedark"
	require('onedark').setup{
		style = 'darker',
		toggle_style_key = '<leader>cl', -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
		toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between
	}
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none"  })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"  })
end

ColorMyPencils()
