print 'load reFileType'

vim.api.nvim_create_autocmd('BufRead', {
	pattern = "*",
	callback = function()
		local file = vim.fn.expand("%:t")

		if file == "nginx.conf.temp" then
			vim.opt.filetype = "nginx"
		elseif string.match(file, "docker%-compose%.") then
			vim.opt.filetype = "yaml.docker-compose"
		end
	end
})
