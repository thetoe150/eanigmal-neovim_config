return {
	-- Mason: manages language server installations
	"mason-org/mason.nvim",
	-- nvim-lspconfig: provides default configurations for LSPs
	"neovim/nvim-lspconfig",
	-- Mason-LSPConfig: bridge between Mason and lspconfig
	"mason-org/mason-lspconfig.nvim",

	config = function ()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗"
				}
			}
		})

		require("mason-lspconfig").setup({
			-- Automatically set up the language servers installed via Mason
			automatic_installation = true,
			-- 'handlers' allows you to apply a standard configuration to all servers
			handlers = {
				function(server_name)
					-- Use the default nvim-lspconfig setup function
					require("lspconfig")[server_name].setup {}
				end,
			},
		})
	end
}
