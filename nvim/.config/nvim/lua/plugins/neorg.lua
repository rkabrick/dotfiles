return {
	{
		"nvim-neorg/neorg",
		dependencies = { "luarocks.nvim", "nvim-lua/plenary.nvim", "tamton-aquib/neorg-jupyter" },
		lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
		version = "*", -- Pin Neorg to the latest stable release
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {
						--
						-- core.defaults contains the following modules
						-- core.clipboard.code-blocks - Removes beginning whitespace from text copied from code blocks.
						-- core.esupports.hop - "Hop" between Neorg links, following them with a single keypress.
						-- core.esupports.indent - A set of instructions for Neovim to indent Neorg documents.
						-- core.esupports.metagen - A Neorg module for generating document metadata automatically.
						-- core.itero - Module designed to continue lists, headings and other iterables.
						-- core.journal - Easily track a journal within Neorg.
						-- core.keybinds - Module for managing keybindings with Neorg mode support.
						-- core.looking-glass - Allows for editing of code blocks within a separate buffer.
						-- core.pivot - Toggles the type of list currently under the cursor.
						-- core.promo - Promotes or demotes nestable items within Neorg files.
						-- core.qol.toc - Generates a table of contents for a given Norg buffer.
						-- core.qol.todo_items - Module for implementing todo lists.
						-- core.tangle - An Advanced Code Block Exporter.
						-- core.upgrade - Converts old versions of the Norg syntax to newer ones.
					}, -- Loads default behaviour

					["core.integrations.treesitter"] = {}, -- Treesitter support for norg
					["core.queries.native"] = {}, -- Query support?
					["core.concealer"] = {}, -- Icons
					["core.summary"] = {},
					["core.export"] = {},
					["core.export.markdown"] = {},
					["core.itero"] = {}, -- Change list types
					["core.esupports.metagen"] = {},
					["external.jupyter"] = {},
					["core.autocommands"] = {},
					["core.dirman"] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								notes = "~/notes",
								tcl = "~/notes/tcl",
								personal = "~/notes/personal",
								thesis = "~/notes/thesis",
								projects = "~/notes/projects",
								misc = "~/notes/misc",
							},
						},
					},
				},
			})
		end,
	},
	--	{
	--		"nvim-neorg/neorg",
	--		build = ":Neorg sync-parsers",
}
