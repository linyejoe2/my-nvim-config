local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fh', ":Telescope find_files hidden=true<CR>", { desc = 'Telescope find hiding files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>lb', builtin.buffers, { desc = 'Lists open buffers in current neovim instance' })
vim.keymap.set('n', '<leader>lc', builtin.git_bcommits, { desc = 'Lists git commits with diff preview' })
vim.keymap.set('n', '<leader>ls', builtin.git_status, { desc = 'Lists current changes.' })
vim.keymap.set('n', '<leader>lf', builtin.treesitter, { desc = 'Lists Function names, variables, from Treesitter!' })
vim.keymap.set('n', '<leader>ld', builtin.lsp_definitions, { desc = 'Goto the definition of the word under the cursor' })
vim.keymap.set('n', '<leader>li', builtin.lsp_implementations,
	{ desc = 'Goto the implementation of the word under the cursor' })
vim.keymap.set('n', '<leader>lt', builtin.lsp_type_definitions,
	{ desc = 'Goto the definition of the type of the word under the cursor' })

require("telescope").setup {
	defaults = {
		file_ignore_patterns = {
			"node_modules",
			"^.*.min.*$"
		},
		layout_config = {
			preview_cutoff = 3,
		},
		mappings = {
			i = {
				["<A-k>"] = "move_selection_next",
				["<A-j>"] = "move_selection_previous",
				["<C-p>"] = require('telescope.actions.layout').toggle_preview,
				-- ["<C-h>"] = "preview_scrolling_left",
				["<C-j>"] = "preview_scrolling_up",
				["<C-k>"] = "preview_scrolling_down",
				-- ["<C-l>"] = "preview_scrolling_right"
			},
			-- n = {
			-- }
		}
	}
}

require 'nvim-web-devicons'.setup {
	override = {
		zsh = {
			icon = "",
			color = "#428850",
			cterm_color = "65",
			name = "Zsh"
		}
	},
	color_icons = true,
	default = true,
	strict = true,
}
