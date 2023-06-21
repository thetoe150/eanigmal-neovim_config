local opts = {noremap = true, silent = true}
vim.keymap.set("n", "<leader>ef", vim.cmd.Ex)
vim.keymap.set("n", "s", "^")
vim.keymap.set("n", "S", "$")

vim.keymap.set("n", "<C-Up>", ":resize -2 <CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2 <CR>", opts)
vim.keymap.set("n", "<C-Right>", " : vertical resize +2 <CR>", opts)
vim.keymap.set("n", "<C-Left>", " : vertical resize -2 <CR>", opts)

-- Visual --
-- Stay in indent Mode
vim.keymap.set("v", ">", ">gv", opts)
vim.keymap.set("v", "<", "<gv", opts)

-- Move Text up and down
vim.keymap.set("v", "<A-j>", ":m .+1<CR>==", opts)
vim.keymap.set("v", "<A-k>", ":m .-2<CR>==", opts)

vim.keymap.set("v", "p", '"_dP', opts)

print("hello from eanigmal - remap file")
