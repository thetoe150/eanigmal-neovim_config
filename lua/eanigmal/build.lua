vim.api.nvim_command('command Build !make')
vim.api.nvim_create_user_command('Run', './bin/SLLsample Heap', {})
