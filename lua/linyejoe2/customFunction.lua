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

function Select_word_to_comma()
	-- Get the current cursor position
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	local line = vim.api.nvim_get_current_line()

	-- Find the position of the first ',' after the cursor
	local sub_line = line:sub(col + 1) -- Get substring from cursor onward
	local end_pos = sub_line:find(",") -- Find first comma
	if end_pos == nil then
		end_pos = sub_line:find("%)")
	end
	print(vim.api.nvim_get_mode().mode)

	-- If a ',' exists, adjust the cursor position accordingly
	if end_pos then
		-- Calculate the actual end position relative to the full line
		local total_chars = end_pos - 2

		-- Select the word between the cursor and the position before the comma
		-- vim.api.nvim_feedkeys(total_chars .. "gh", "n", false) -- 'l' moves right
		if total_chars <= 0 then
			-- vim.api.nvim_feedkeys("gh", "n", false)
			vim.cmd("norm! l")
			Select_word_to_comma()
		else
			if vim.api.nvim_get_mode().mode == "i" then
				vim.cmd("norm! l")
			end
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("v" .. total_chars .. 'l<C-G>', true, true, true), "n",
				false) -- 'l' moves right
		end
	end
end

function Detect_format_on_save_setting()
	local editorconfig_path = vim.fn.getcwd() .. "/.editorconfig"

	if vim.fn.filereadable(editorconfig_path) == 1 then
		for line in io.lines(editorconfig_path) do
			-- 去除首尾空白，並且忽略註解行
			line = line:match("^%s*(.-)%s*$")
			if #line > 0 and not line:match("^%s*#") then
				-- 匹配 key=value 格式
				local key, val = line:match("^(%S+)%s*=%s*(.+)$")


				-- 判斷 Format_on_save 是否為 false
				if key == "Format_on_save" and val == "false" then
					print("Format_on_save is disabled")
					return false
				end
			end
		end
	end

	-- 若未找到 Conform，默認為啟用
	print("Format_on_save is enabled")
	return true
end
