local builtin = require('telescope.builtin')
local opts = { noremap = true, silent = true}
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>d', builtin.buffers, {})
vim.keymap.set('n', '<leader>D', ":Telescope buffers sort_lastused=true sort_mru=true<CR>", {})
-- vim.keymap.set('n', '<leader>sh', builtin.help_tags, {})
-- vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })

-- if you on Window and want to be fast, you should install ripgrep.
-- https://github.com/BurntSushi/ripgrep
-- After installing ripgrep, telescope automaticly use it to live grep search
-- vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
-- vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })

-- vim.keymap.set('n', '<leader>rg', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

require('telescope').setup{
	defaults = {
		mappings = {
			n = {
				['<leader>z'] = require('telescope.actions').delete_buffer
			},

			i = {
				['<leader>z'] = require('telescope.actions').delete_buffer
			}
		},
		-- file_ignore_patterns = {
		-- 	"node_modules"
		-- }
	}
}

function vim.getVisualSelection()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg('v')
	vim.fn.setreg('v', {})

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ""
	end
end

vim.keymap.set('n', '<leader>G', ':Telescope current_buffer_fuzzy_find<cr>', opts)
vim.keymap.set('v', '<leader>G', function()
									local text = vim.getVisualSelection()
									builtin.current_buffer_fuzzy_find({default_text = text})
								end, opts)

vim.keymap.set('n', '<leader>g', ':Telescope live_grep<cr>', opts)
vim.keymap.set('v', '<leader>g', function()
									local text = vim.getVisualSelection()
									builtin.live_grep({default_text = text})
								end, opts)
