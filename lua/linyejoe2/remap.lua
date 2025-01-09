print("load linyejoe2.remap")

require("linyejoe2.customFunction")

vim.g.mapleader = " "

vim.keymap.set("n", "<C-c>", '"+y')
vim.keymap.set("v", "<C-c>", '"+y')

vim.keymap.set("n", '<leader>==', 'm`gg=G``')

vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<PageUp>", "<C-u>zz")
vim.keymap.set("n", "<PageDown>", "<C-d>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dp")

-- linyejoe2

vim.keymap.set("n", "<leader>s", ":echo 'adsf'<CR>")
vim.keymap.set("n", ",", "<C-u>zz")
vim.keymap.set("n", ".", "<C-d>zz")

vim.keymap.set("n", "<C-A-l", "<C-w>l")
vim.keymap.set("n", "<C-A-h>", "<C-w>h")
vim.keymap.set("n", "<C-A-j>", "<C-w>j")
vim.keymap.set("n", "<C-A-k>", "<C-w>k")
vim.keymap.set("t", "<C-A-l>", "<C-w>l")
vim.keymap.set("t", "<C-A-h>", "<C-w>h")
vim.keymap.set("t", "<C-A-j>", "<C-w>j")
vim.keymap.set("t", "<C-A-k>", "<C-w>k")
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]])

vim.keymap.set("n", "<C-A-Left>", "<C-w><")
vim.keymap.set("n", "<C-A-Right>", "<C-w>>")
vim.keymap.set("n", "<C-A-Up>", "<C-w>+")
vim.keymap.set("n", "<C-A-Down>", "<C-w>-")

-- vim.keymap.set('n', '<C-Left>', 'gh', { noremap = true, silent = true })  -- Select to the start of the previous word
-- vim.keymap.set('n', '<C-Right>', 'gh', { noremap = true, silent = true }) -- Select to the end of the next word

vim.keymap.set('n', '<C-S-Left>', 'gh', { noremap = true, silent = true })  -- Shrink selection left
vim.keymap.set('n', '<C-S-Right>', 'gh', { noremap = true, silent = true }) -- Extend selection right

-- vim.keymap.set('n', '<C-Left>', 'b', { noremap = true, silent = true })  -- Move to the start of the previous word
-- vim.keymap.set('n', '<C-Right>', 'e', { noremap = true, silent = true }) -- Move to the end of the next word

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { noremap = true, silent = true })

-- Re write :w with <C-s> from vscode
vim.keymap.set('n', "<C-s>", ":w<CR>")
vim.keymap.set('v', "<C-s>", "<esc>:w<CR>")
vim.keymap.set('i', "<C-s>", "<esc>:w<CR>")
vim.keymap.set('s', "<C-s>", "<esc>:w<CR>")


-- Re write gg<S-v>G with <C-a> from vscode
vim.keymap.set("n", "<C-a>", "gg<S-v>G")
vim.keymap.set("v", "<C-a>", "<esc>gg<S-v>G")
vim.keymap.set("i", "<C-a>", "<esc>gg<S-v>G")
vim.keymap.set("s", "<C-a>", "<esc>gg<S-v>G")

-- Re write dd with <C-S-k> from vscode
-- vim.keymap.set("n", "C-S-K>", "dd")
