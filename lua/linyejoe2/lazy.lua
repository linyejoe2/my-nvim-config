-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- add your plugins here
	{ "rose-pine/neovim", name = "rose-pine" },
	{ 'williamboman/mason.nvim' },
	{ 'williamboman/mason-lspconfig.nvim' },
	{ "neovim/nvim-lspconfig" },
	{ "nvim-telescope/telescope.nvim", tag = "0.1.8" },
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "mbbill/undotree" },
	{ 'akinsho/toggleterm.nvim', version = "*", config = true },
	{ "numToStr/Comment.nvim" },
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{ "nvim-tree/nvim-web-devicons", opts = {} },
	{ 'mg979/vim-visual-multi', branch = 'master', config = function ()
		vim.g.VM_maps = {
			["Find Under"] = '<C-n>',
			["Add Cursor Down"] = '<C-Down>', -- Example of remapping Add Cursor Down
			["Add Cursor Up"] = '<C-Up>', -- Example of remapping Add Cursor Up
			["Select l"] = '',
			["Select h"] = '',
		}
	end },
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
	  opts = {},
	  -- Optional dependencies
	  -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
	  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
	}
},
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

print("load lazy")
