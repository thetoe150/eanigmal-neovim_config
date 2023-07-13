local dap = require('dap')
vim.keymap.set('n', '<Leader>dc', function() dap.continue() end)
vim.keymap.set('n', '<Leader>o', function() dap.step_over() end)
vim.keymap.set('n', '<Leader>di', function() dap.step_into() end)
vim.keymap.set('n', '<Leader>do', function() dap.step_out() end)
vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() dap.set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end)

local widgets = require('dap.ui.widgets')
vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
  widgets.hover()
end)

vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
  widgets.preview()
end)

vim.keymap.set('n', '<Leader>df', function()
  widgets.centered_float(widgets.frames)
end)

vim.keymap.set('n', '<Leader>ds', function()
  widgets.centered_float(widgets.scopes)
end)

dap.adapters.lldb = {
	type = "executable",
	command = "/usr/bin/lldb-vscode",
	name = "lldb",
}

local lldb = {
	name = "Launch lldb",
	type = "lldb",
	request = "launch",
	program = function()
	return vim.fn.input(
	"Path to executable: ",
	vim.fn.getcwd() .. "/",
	"file"
	)
	end,
	cwd = "${workspaceFolder}",
	stopOnEntry = false,
	args = {},
	runInTerminal = false,
}

dap.adapters.gdb = {
	type = "executable",
	command = "C:/Users/theto/.vscode/extensions/ms-vscode.cpptools-1.16.3-win32-x64/debugAdapters/bin/WindowsDebugLauncher.exe",
	name = "gdb",
}

local gdb = {
	name = "Launch gdb",
	type = "gdb",
	request = "launch",
	program = function()
		return vim.fn.input(
		"Path to executable: ",
		vim.fn.getcwd() .. "/bin/SLLsample.exe",
		-- vim.fn.getcwd() .. "/bin/main.exe",
		"file"
		)
	end,
	cwd = "${workspaceFolder}",
	stopOnEntry = false,
	args = {},
	runInTerminal = false,
}

dap.adapters.cppdb = {
	type = "executable",
	command = vim.fn.stdpath('data') .. '\\mason\\bin\\OpenDebugAD7',
	name = "cppdb",
}

local cppdb = {
	name = "Launch cppdb",
	type = "cppdb",
	request = "launch",
	program = function()
		return vim.fn.input(
		"Path to executable: ",
		vim.fn.getcwd() .. "/bin/SLLsample.exe",
		-- vim.fn.getcwd() .. "/bin/main.exe",
		"file"
		)
	end,
	cwd = "${workspaceFolder}",
	stopOnEntry = false,
	args = {},
	runInTerminal = false,
}
require('dap').configurations.cpp = {
	cppdb,
	gdb
}

dap.configurations.h = dap.configurations.cpp
