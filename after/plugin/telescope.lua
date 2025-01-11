local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fh', ":Telescope find_files hidden=true<CR>", { desc = 'Telescope find hiding files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>bl', builtin.buffers, {desc = 'Lists open buffers in current neovim instance'})

require("telescope").setup{
        defaults = {
                file_ignore_patterns = {
                        "node_modules"
				}
        }
}

require'nvim-web-devicons'.setup{
	 override = {
	  zsh = {
		icon = "",
		color = "#428850",
		cterm_color = "65",
		name = "Zsh"
	  }
	 };
	color_icons = true;
	default = true;
	strict = true;
}
