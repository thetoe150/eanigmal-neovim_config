local opts = {noremap = true, silent = true}
vim.keymap.set("n", "<leader>ef", vim.cmd.Ex)
vim.keymap.set({"n", "v"}, "<leader>w", ":w<CR>")
vim.keymap.set({"n", "v"}, "<leader>q", ":q<CR>")

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

-- change directory --
vim.keymap.set({"n", "i"}, "<leader>cd", ":cd %:p:h")

print("hello from eanigmal - remap file")

