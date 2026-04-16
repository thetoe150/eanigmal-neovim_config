vim.lsp.enable({
	"clangd",
})

vim.diagnostic.config({
	virtual_lines = false,
	-- virtual_text = true,
	underline = false,
	float = {
		source = true,
	}
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client:supports_method('textDocument/completion') then
      -- Enable auto-completion
      vim.lsp.completion.enable(true, client.id)
    end
  end,
})

vim.keymap.set('i', '<c-space>', function()
  vim.lsp.completion.get()
end)
