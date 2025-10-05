require "nvchad.mappings"

vim.g.mapleader = " "

-- Telescope

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Find files' })
vim.keymap.set('n', '<C-f>', builtin.live_grep, { desc = "Live grep" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "List buffers" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help tags" })

-- toggle term
vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm direction=float<CR>", { desc = "Toggle floating terminal" })

-- nvim tree

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'File Explorer' })

-- nvim tree | tabs command

vim.keymap.set('n', '<A-PageDown>', ':bnext<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<A-PageUp>', ':bprevious<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<A-w>', ':bdelete<CR>', { noremap = true, silent = true })


local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
