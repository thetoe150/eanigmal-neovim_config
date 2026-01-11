return {
  -- 1. Mason for managing binaries (LSP, DAP, Linters)
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },

  -- 2. The Bridge (Automatic enabling for Neovim 0.11)
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig", -- Required for server definitions
    },
    opts = {
      -- List the LSPs you want automatically installed
      ensure_installed = {
        "lua_ls",
      },
      
      -- NEW FOR 0.11: Automatically calls vim.lsp.enable() for you
      automatic_enable = true,
    },
  },
}
