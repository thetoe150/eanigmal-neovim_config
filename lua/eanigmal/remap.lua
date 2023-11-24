local opts = {noremap = true, silent = true}

-- most used map --
vim.keymap.set({"n", "v"}, "<leader>q", ":q<CR>")
vim.keymap.set({"n", "v"}, "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- fold --
vim.keymap.set("n", "zv", "zr")
vim.keymap.set("n", "zb", "zm")

-- reposition window --
vim.keymap.set("n", "<C-Up>", ":resize -2 <CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2 <CR>", opts)
vim.keymap.set("n", "<C-Right>", " : vertical resize +2 <CR>", opts)
vim.keymap.set("n", "<C-Left>", " : vertical resize -2 <CR>", opts)

-- buffer --
vim.keymap.set({"n", "v"}, "#", "<CS-6>", opts)
vim.keymap.set({"n", "v"}, "^", ":bprevious <CR>", opts)
vim.keymap.set({"n", "v"}, "$", ":bnext <CR>", opts)
-- vim.keymap.set({"n", "v"}, "^", ":enew <CR>", opts) -- new buffer in new file
-- vim.keymap.set({"n", "v"}, "$", ":bd <CR>", opts) -- delete buffer

-- motion --
vim.keymap.set({"n", "v"}, "s", "^", opts)
vim.keymap.set({"n", "v"}, "S", "$", opts)

-- Visual --
-- Stay in indent Mode
vim.keymap.set("v", ">", ">gv", opts)
vim.keymap.set("v", "<", "<gv", opts)

-- Move Text up and down
vim.keymap.set("v", "<A-j>", ":m .+1<CR>==", opts)
vim.keymap.set("v", "<A-k>", ":m .-2<CR>==", opts)

vim.keymap.set("v", "p", '"_dP', opts)

-- Auto close bracket
vim.keymap.set("i", "{", "{}<ESC>ha", opts);
vim.keymap.set("i", "[", "[]<ESC>ha", opts);
vim.keymap.set("i", "(", "()<ESC>ha", opts);
vim.keymap.set("i", "\"","\"\"<ESC>ha", opts);
vim.keymap.set("i", "'", "''<ESC>ha", opts);

-- change directory
vim.keymap.set("n", "<leader>cd", ":cd %:p:h<CR>", opts)

-- copy to system clipboard
vim.keymap.set("v", "<leader>y", "\"+y", opts)
vim.keymap.set("n", "<leader>yy", "\"+yy", opts)

-- yank from system clipboard
vim.keymap.set("n", "<leader>p", "\"+p", opts)

-- copy path of the current file to system clipboard
vim.keymap.set("n", "<leader>cp", ":let @+ = expand(\"%:p\") <CR>", opts)
