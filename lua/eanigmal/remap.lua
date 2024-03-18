local opts = {noremap = true, silent = true}

-- most used map --
vim.keymap.set({"n", "v"}, "<leader>q", ":q<CR>")
vim.keymap.set({"n", "v"}, "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- reposition window --
vim.keymap.set("n", "<C-Up>", ":resize -2 <CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2 <CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2 <CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2 <CR>", opts)

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

-- change directory to current working directory
vim.keymap.set("n", "<leader>cd", ":cd %:p:h<CR>", opts)

-- go back 1 directory
vim.keymap.set("n", "-", ":cd..<CR>:pwd<CR>", opts)

-- copy to system clipboard
vim.keymap.set("v", "<leader>y", "\"+y", opts)
vim.keymap.set("n", "<leader>yy", "\"+yy", opts)

-- yank from system clipboard
vim.keymap.set("n", "<leader>p", "\"+p", opts)

-- copy path of the current file to system clipboard
vim.keymap.set("n", "<leader>cp", ":let @+ = expand(\"%:p\") <CR>", opts)

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
vim.keymap.set("t", "<C-n>", "<C-\\><C-n>", opts)
vim.keymap.set("t", "<C-w>", "<C-\\><C-n><C-w>", opts)
-- vim.keymap.set("t", "<leader><Tab>", "<C-\\><C-n>gt", opts)
-- vim.keymap.set({"n","v"}, "<leader><Tab>", "gt", opts)

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
-- vim.keymap.set({"n", "v"}, "<leader>2", function() vim.cmd("let g:netrw_browse_split = 2") end, opts)
-- vim.keymap.set({"n", "v"}, "<leader>3", function() vim.cmd("let g:netrw_browse_split = 3") end, opts)
