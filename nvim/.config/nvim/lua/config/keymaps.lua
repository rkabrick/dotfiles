-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set(
	"n",
	"<leader>sx",
	require("telescope.builtin").resume,
	{ noremap = true, silent = true, desc = "Resume" }
)

vim.keymap.set(
	"n",
	"<leader>nw",
	"<cmd> Neorg workspace tcl <CR>",
	{ noremap = true, silent = true, desc = "Work Notes" }
)

vim.keymap.set(
	"n",
	"<leader>np",
	"<cmd> Neorg workspace personal <CR>",
	{ noremap = true, silent = true, desc = "Personal Notes" }
)

vim.keymap.set(
	"n",
	"<C-f>",
	"<cmd>terminal tmux-sessionizer-norg<CR>",
	{ noremap = true, silent = true, desc = "TmuxSessionizer" }
)

-- Function to check if the current window is at the edge in a given direction
local function is_window_at_edge(direction)
	local cur_win = vim.api.nvim_get_current_win()
	-- Move in the specified direction
	vim.api.nvim_command("wincmd " .. direction)
	-- Check if the window changed
	return cur_win == vim.api.nvim_get_current_win()
end

-- Function to navigate windows or send keystrokes to tmux
local function navigate_or_send_to_tmux(direction, tmux_key)
	-- Check if the current window is at the edge
	if is_window_at_edge(direction) then
		local tmux_command = "silent !tmux select-pane -" .. tmux_key
		vim.api.nvim_exec(tmux_command, false)
	else
		vim.api.nvim_command("wincmd " .. direction)
	end
end

-- Keymap for enhanced navigation
vim.keymap.set("n", "<C-h>", function()
	navigate_or_send_to_tmux("h", "L")
end, { noremap = true, silent = true, desc = "Navigate Left or to tmux" })
vim.keymap.set("n", "<C-j>", function()
	navigate_or_send_to_tmux("j", "D")
end, { noremap = true, silent = true, desc = "Navigate Down or to tmux" })
vim.keymap.set("n", "<C-k>", function()
	navigate_or_send_to_tmux("k", "U")
end, { noremap = true, silent = true, desc = "Navigate Up or to tmux" })
vim.keymap.set("n", "<C-l>", function()
	navigate_or_send_to_tmux("l", "R")
end, { noremap = true, silent = true, desc = "Navigate Right or to tmux" })
