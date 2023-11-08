local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
vim.keymap.set('n', '<leader>sb', builtin.buffers, {})
vim.keymap.set('n', '<leader>sh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })

-- if you on Window and want to be fast, you should install ripgrep.
-- https://github.com/BurntSushi/ripgrep
-- After installing ripgrep, telescope automaticly use it to live grep search
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })

require('telescope').setup{
	defaults = {
		mappings = {
			n = {
				['<leader>d'] = require('telescope.actions').delete_buffer
			},

			i = {
				['<leader>d'] = require('telescope.actions').delete_buffer
			}
		},
		file_ignore_patterns = {
			"node_modules"
		}
	}
}
