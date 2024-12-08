-- fugitive
vim.keymap.set("n", "<leader>r", vim.cmd.Git)

-- undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- lsp

-- telescope
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

local opts = { noremap = true, silent = true}

function vim.toogleFile()
	local filename = vim.fn.expand('%:t')
	local ext_pos = string.find(filename, '.h');
	if (ext_pos ~= nil) then
		local des_filename = string.sub(filename, 1, ext_pos)
		return des_filename .. 'cpp'
	end

	ext_pos = string.find(filename, '.cpp');
	if (ext_pos ~= nil) then
		local des_filename = string.sub(filename, 1, ext_pos)
		return des_filename .. 'h'
	end
end

vim.keymap.set('n', '<leader>h', function()
									local file = vim.toogleFile()
									builtin.find_files({search_file = file})
								end, opts)

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

vim.keymap.set('n', '<leader>d', builtin.buffers, {})
vim.keymap.set('n', '<leader>D', ":Telescope buffers sort_lastused=true sort_mru=true<CR>", {})

vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('v', '<leader>f', function()
									local text = vim.getVisualSelection()
									builtin.find_files({default_text = text})
								end, opts)

vim.keymap.set('n', '<leader>g', ':Telescope live_grep<cr>', opts)
vim.keymap.set('v', '<leader>g', function()
									local text = vim.getVisualSelection()
									builtin.live_grep({default_text = text})
								end, opts)

vim.keymap.set('n', '<leader>G', ':Telescope current_buffer_fuzzy_find<cr>', opts)
vim.keymap.set('v', '<leader>G', function()
									local text = vim.getVisualSelection()
									builtin.current_buffer_fuzzy_find({default_text = text})
								end, opts)


vim.keymap.set({'n'}, '<leader>z', function()
											actions.delete_buffer()
										end, opts)
