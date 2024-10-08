-- default config
require("bigfile").setup {
  filesize = 2, -- size of the file in MiB, the plugin round file sizes to the closest MiB
  pattern = { "*" }, -- autocmd pattern or function see <### Overriding the detection of big files>
  features = { -- features to disable
    "indent_blankline",
    "illuminate",
    "lsp",
    "treesitter",
    "syntax",
    "matchparen",
    "vimopts",
    "filetype",
  },
}

-- all fields except `name` and `disable` are optional
-- local mymatchparen = {
--   name = "mymatchparen", -- name
--   opts = {
--     defer = false, -- set to true if `disable` should be called on `BufReadPost` and not `BufReadPre`
--   },
--   disable = function() -- called to disable the feature
--     vim.cmd "NoMatchParen"
--   end,
-- }
-- 
-- require("bigfile").setup {
--   filesize = 1,
--   features = { "treesitter", mymatchparen }
-- }
-- 
-- require("bigfile").setup {
--   -- detect long python files
--   pattern = function(bufnr, filesize_mib)
--     -- you can't use `nvim_buf_line_count` because this runs on BufReadPre
--     local file_contents = vim.fn.readfile(vim.api.nvim_buf_get_name(bufnr))
--     local file_length = #file_contents
--     local filetype = vim.filetype.match({ buf = bufnr })
--     if file_length > 5000 and filetype == "python" then
--       return true
--     end
--   end
-- }
