local dv = require("diffview.config")

-- vim.keymap.set('n', "<leader>dv", function() dv.actions.diffview() end)
vim.keymap.set('n', "<leader>dv", ":DiffviewOpen <CR>")
