-- lsp
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


vim.keymap.set({'n', 'i'}, '<leader>z', function()
											actions.delete_buffer()
										end, opts)

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
