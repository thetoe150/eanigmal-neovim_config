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
