vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
-- vim.opt.expandtab = 4

vim.opt.scrolloff = 8
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.termguicolors = true

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- vim.cmd [[
--   autocmd BufWritePre *.md silent! :%!prettier --stdin-filepath %
-- ]]

-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "lua",
-- 	callback = function()
-- 		vim.schedule(function()
-- 			print("Save lua file")
-- 		end)
-- 	end
-- })

-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "markdown",
-- 	callback = function()
-- 		vim.schedule(function()
-- 			print("We are in a md file😎")
-- 		end)
--
-- 		-- try_lint without arguments runs the linters defined in `linters_by_ft`
-- 		-- for the current filetype
-- 		require("lint").try_lint()
--
-- 		-- You can call `try_lint` with a linter name or a list of names to always
-- 		-- run specific linters, independent of the `linters_by_ft` configuration
-- 		require("lint").try_lint("cspell")
-- 	end,
-- })
