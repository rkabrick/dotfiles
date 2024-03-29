return {
	"sidebar-nvim/sidebar.nvim",
	config = function()
		require("sidebar-nvim").setup({
			disable_default_keybindings = 0,
			bindings = nil,
			open = false,
			side = "right",
			initial_width = 35,
			hide_statusline = false,
			update_interval = 1000,
			sections = { "todos", "datetime", "files", "diagnostics" },
			section_separator = { "", "-----", "" },
			section_title_separator = { "" },
			containers = {
				attach_shell = "/bin/zsh",
				show_all = true,
				interval = 5000,
			},
			datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },
			todos = { ignored_paths = { "~" } },
			--disable_default_keybindings = 1,
			--bindings = {
			--  ["o"] = ":SidebarOpen<CR>",
			--  ["c"] = ":SidebarClose<CR>",
			--  ["t"] = ":SidebarToggle<CR>",
			--},
		})
	end,
}
