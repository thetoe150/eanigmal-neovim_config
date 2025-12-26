local opts = {noremap = true, silent = true}

vim.keymap.set({'n', 'v'}, "<leader>q", ":q<CR>")
vim.keymap.set({'n', 'v'}, "<leader>w", ":w<CR>")
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>e", ":Oil<CR>")

-- buffer
vim.keymap.set({"n", "v"}, "<leader>s", "<CS-6>", opts)

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

-- change directory to current working directory
vim.keymap.set("n", "<leader>cd", ":cd %:p:h<CR>", opts)

-- go back 1 directory
vim.keymap.set("n", "-", ":cd..<CR>:pwd<CR>", opts)

-- copy to system clipboard
vim.keymap.set("v", "<leader>y", "\"+y", opts)
vim.keymap.set("n", "<leader>yy", "\"+yy", opts)

-- paste from system clipboard
vim.keymap.set("n", "<leader>p", "\"+p", opts)

-- toggle search hightlight
local function toggleHightlight()
	-- if vim.opt.hlsearch == true then
	-- 	vim.opt.hlsearch = false
	-- else
	-- 	vim.opt.hlsearch = true
	-- end
	vim.cmd("set hlsearch!")
end
vim.keymap.set({"n", "v"}, "<leader>n", toggleHightlight, opts)

-- terminal
vim.keymap.set({"n", "v"}, "<leader>t", ":tabnew<CR>:ter<CR>a", opts)
vim.keymap.set({"n", "v"}, "<leader>T", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 5)
end)

-- tab
vim.keymap.set({"n"}, "t", "gt", opts)
vim.keymap.set({"n"}, "T", "gT", opts)
vim.keymap.set({"n"}, "t", "gt", opts)
vim.keymap.set({"n"}, "T", "gT", opts)

vim.keymap.set({"n"}, "1t", "1gt", opts)
vim.keymap.set({"n"}, "2t", "2gt", opts)
vim.keymap.set({"n"}, "3t", "3gt", opts)
vim.keymap.set({"n"}, "4t", "4gt", opts)
vim.keymap.set({"n"}, "5t", "5gt", opts)
vim.keymap.set({"n"}, "6t", "6gt", opts)
vim.keymap.set({"n"}, "7t", "7gt", opts)
vim.keymap.set({"n"}, "8t", "8gt", opts)
vim.keymap.set({"n"}, "9t", "9gt", opts)

vim.keymap.set("t", "<C-n>", "<C-\\><C-n>", opts)
-- vim.keymap.set("t", "<C-w>", "<C-\\><C-n><C-w>", opts)
-- vim.keymap.set("t", "<leader><Tab>", "<C-\\><C-n>gt", opts)
-- vim.keymap.set({"n","v"}, "<leader><Tab>", "gt", opts)

vim.keymap.set({"n", "v"}, "<leader>o", ":copen<CR>", opts)

-- wrapline
local function wrap_line()
	vim.api.nvim_cmd({cmd = "set", args = {"wrap"}}, {})
	vim.api.nvim_cmd({cmd = "set", args = {"linebreak"}}, {})
	vim.api.nvim_cmd({cmd = "set", args = {"breakindent"}}, {})
end

vim.keymap.set({"n", "v"}, "<leader>b", wrap_line, opts)

-- netrw slit mode
-- vim.keymap.set({"n", "v"}, "<leader>0", function() vim.cmd("let g:netrw_browse_split = 0") end, opts)
-- vim.keymap.set({"n", "v"}, "<leader>1", function() vim.cmd("let g:netrw_browse_split = 1") end, opts)
