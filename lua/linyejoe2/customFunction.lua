print("load customFunction")

-- Define the custom rename function
vim.api.nvim_create_user_command('Rf', function(args)
	local old_file = vim.fn.expand('%:p') -- Get the current file's full path
	local new_file = vim.fn.fnamemodify(old_file, ':h') .. '/' .. args.args

	-- Rename the file
	vim.fn.rename(old_file, new_file)

	-- Delete the old file buffer
	vim.api.nvim_command('bd')

	-- Update the buffer to use the new file
	vim.api.nvim_command('edit ' .. new_file)
end, {
	nargs = 1, -- Requires exactly one argument (the new file name)
	desc = 'Rename the current file',
})
