-- fugitive
vim.keymap.set("n", "<leader>r", vim.cmd.Git)

-- undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- lsp
-- Optional: Basic keymaps and autocmds for LSP functionality
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(args)
		local bufnr = args.buf
		-- set buffer-local keymaps (leader key is mapped to <Space> by default)
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {buffer=bufnr, desc="Go to Declaration"})
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer=bufnr, desc="Go to Definition"})
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer=bufnr, desc="Hover Information"})
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {buffer=bufnr, desc="Go to Implementation"})
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, {buffer=bufnr, desc="Signature Help"})
		vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, {buffer=bufnr, desc="Add Workspace Folder"})
		vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, {buffer=bufnr, desc="Remove Workspace Folder"})
		vim.keymap.set('n', '<leader>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, {buffer=bufnr, desc="List Workspace Folders"})
		vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, {buffer=bufnr, desc="Go to Type Definition"})
		vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {buffer=bufnr, desc="Rename"})
		vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {buffer=bufnr, desc="Code Action"})
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, {buffer=bufnr, desc="Go to References"})
		vim.keymap.set('n', '<leader>f', function()
			vim.lsp.buf.format({ async = true })
		end, {buffer=bufnr, desc="Format Buffer"})
	end,
})

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
