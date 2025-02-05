-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- for avante
local hostname = vim.fn.system("hostname"):gsub("%s+", "")

local aiDeviceList = {
	"randy-4090"
}

local loadAvanteFlag = false
for _, device in ipairs(aiDeviceList) do
	if hostname == device then
		loadAvanteFlag = true
		break
	end
end

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- add your plugins here
		{ "rose-pine/neovim",                 name = "rose-pine" },
		{ 'williamboman/mason.nvim' },
		{ 'williamboman/mason-lspconfig.nvim' },
		{ "neovim/nvim-lspconfig" },
		{ "nvim-telescope/telescope.nvim",    tag = "0.1.8" },
		{ "nvim-treesitter/nvim-treesitter",  build = ":TSUpdate" },
		{ "mbbill/undotree" },
		{ 'akinsho/toggleterm.nvim',          version = "*",      config = true },
		{ "numToStr/Comment.nvim" },
		{ 'hrsh7th/cmp-nvim-lsp' },
		{ 'hrsh7th/nvim-cmp' },
		{ "nvim-tree/nvim-web-devicons",      opts = {} },
		{
			"lewis6991/gitsigns.nvim",
			config = function()
				require('gitsigns').setup()
			end
		},
		{
			"kevinhwang91/nvim-ufo",
			dependencies = { "kevinhwang91/promise-async" },
			config = function()
				vim.o.foldcolumn = "1"
				vim.o.foldlevel = 99
				vim.o.foldlevelstart = 99
				vim.o.foldenable = true

				-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
				vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
				vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
				-- vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
				-- vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith)

				require('ufo').setup({
					provider_selector = function(bufnr, filetype, buftype)
						return {
							-- "lsp",
							'treesitter', 'indent' }
					end
				})
			end
		},
		{
			'stevearc/conform.nvim',
			opts = {},
			event = { "BufReadPre", "BufNewFile" },
			config = function()
				local conform = require("conform")

				conform.setup({
					formatters_by_ft = {
						markdown = { "markdownlint-cli2" },
						json = { "prettier" },
						yaml = { "prettier" }
					},
					format_on_save = {
						lsp_fallback = true,
						async = false,
					},
				})
			end,
		},
		{
			"mfussenegger/nvim-lint",
			event = { "BufReadPre", "BufNewFile" },
			config = function()
				local lint = require("lint")

				lint.linters_by_ft = {
					markdown = { "markdownlint-cli2" },
					json = { "biomejs" },
					-- yaml = { "biomejs" }
				}

				local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

				vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
					group = lint_augroup,
					callback = function()
						lint.try_lint()
					end,
				})
			end,
		},
		{
			'nvim-lualine/lualine.nvim',
			dependencies = { 'nvim-tree/nvim-web-devicons' }
		},
		{
			'mg979/vim-visual-multi',
			branch = 'master',
			config = function()
				vim.g.VM_maps = {
					["Find Under"] = '<C-n>',
					["Add Cursor Down"] = '<C-Down>', -- Example of remapping Add Cursor Down
					["Add Cursor Up"] = '<C-Up>', -- Example of remapping Add Cursor Up
					["Select l"] = '',
					["Select h"] = '',
				}
			end
		},
		{ 'mfussenegger/nvim-dap' },
		{
			"L3MON4D3/LuaSnip",
			-- follow latest release.
			version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
			-- install jsregexp (optional!).
			build = "make install_jsregexp"
		},
		{
			"iamcco/markdown-preview.nvim",
			cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
			build = "cd app && npm install && git restore .",
			-- or if you use yarn: (I have not checked this, I use npm)
			-- build = "cd app && yarn install && git restore .",
			init = function()
				vim.g.mkdp_filetypes = { "markdown" }
			end,
			ft = { "markdown" },
		},
		{
			'stevearc/oil.nvim',
			---@module 'oil'
			---@type oil.SetupOpts
			opts = {
				keymaps = {
					["g?"] = { "actions.show_help", mode = "n" },
					["<CR>"] = "actions.select",
					["<C-s>"] = false,
					["<C-h>"] = { "actions.select", opts = { horizontal = true } },
					["<C-t>"] = { "actions.select", opts = { tab = true } },
					["<C-p>"] = "actions.preview",
					["<C-c>"] = { "actions.close", mode = "n" },
					["<C-l>"] = "actions.refresh",
					["-"] = { "actions.parent", mode = "n" },
					["_"] = { "actions.open_cwd", mode = "n" },
					["`"] = { "actions.cd", mode = "n" },
					["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
					["gs"] = { "actions.change_sort", mode = "n" },
					["gx"] = "actions.open_external",
					["g."] = { "actions.toggle_hidden", mode = "n" },
					["g\\"] = { "actions.toggle_trash", mode = "n" },
				}
			},
			-- Optional dependencies
			-- dependencies = { { "echasnovski/mini.icons", opts = {} } },
			dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
		},
		loadAvanteFlag and {
			"yetone/avante.nvim",
			event = "VeryLazy",
			lazy = false,
			version = false, -- set this to "*" if you want to always pull the latest change, false to update on release
			opts = {
				-- add any opts here
				provider = "ollama",
				vendors = {
					ollama = {
						__inherited_from = "openai",
						api_key_name = "",
						endpoint = "http://172.22.16.1:11434/v1",
						model = "gemma2:27b",
					},
				},
			},
			-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
			build = "make",
			-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
			dependencies = {
				"stevearc/dressing.nvim",
				"nvim-lua/plenary.nvim",
				"MunifTanjim/nui.nvim",
				--- The below dependencies are optional,
				"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
				-- "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
				-- "zbirenbaum/copilot.lua", -- for providers='copilot'
				{
					-- support for image pasting
					"HakonHarnes/img-clip.nvim",
					event = "VeryLazy",
					opts = {
						-- recommended settings
						default = {
							embed_image_as_base64 = false,
							prompt_for_file_name = false,
							drag_and_drop = {
								insert_mode = true,
							},
							-- required for Windows users
							use_absolute_path = true,
						},
					},
				},
				{
					-- Make sure to set this up properly if you have lazy=true
					'MeanderingProgrammer/render-markdown.nvim',
					opts = {
						file_types = { "markdown", "Avante" },
					},
					ft = { "markdown", "Avante" },
				},
			},
		} or nil,
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})

print("load lazy")
