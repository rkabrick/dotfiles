-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
-- Disable autoformat for lua files
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "cpp" },
	callback = function()
		vim.b.autoformat = false
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "norg",
	callback = function()
		vim.cmd("Copilot disable")
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*" },
	command = [[%s/\s\+$//e]],
})

local function get_git_root(current_file_path)
	-- Change directory temporarily to the folder where current file is
	local cmd = "cd " .. vim.fn.fnamemodify(current_file_path, ":h") .. " && git rev-parse --show-toplevel 2> /dev/null"
	local git_root = vim.fn.systemlist(cmd)[1]
	return git_root
end
