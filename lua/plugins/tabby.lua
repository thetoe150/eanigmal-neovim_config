return {
	'nanozuki/tabby.nvim',

	config = function ()
		require("tabby").setup{
			line = function(line)
				return {
				  line.tabs().foreach(function(tab)
					local hl = tab.is_current() and { fg = '#ffffff', bg = '#5e81ac', style = 'bold' } or { fg = '#d8dee9', bg = '#202020' }
					return {
					  line.sep(' ', hl, hl),
					  tab.number(),
					  tab.name(),
					  line.sep(' ', hl, hl),
					  hl = hl,
					  margin = ' ',
					}
				  end),
				  line.spacer(),
				}
			  end,
		}
	end
  -- option = {}, -- setup modules' option,
}
