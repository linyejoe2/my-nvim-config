local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
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
