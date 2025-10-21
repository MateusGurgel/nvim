require "nvchad.mappings"

vim.g.mapleader = " "

-- Telescope

local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local builtin = require "telescope.builtin"
vim.keymap.set("n", "<C-f>", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "List buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })

local function find_files_multi()
  builtin.find_files {
    attach_mappings = function(prompt_bufnr, map)
      local function open_selected_files()
        local picker = action_state.get_current_picker(prompt_bufnr)
        local multi = picker:get_multi_selection()
        if vim.tbl_isempty(multi) then
          actions.select_default(prompt_bufnr)
        else
          actions.close(prompt_bufnr)
          for _, entry in ipairs(multi) do
            vim.cmd("edit " .. vim.fn.fnameescape(entry.path))
          end
        end
      end

      map("i", "<CR>", open_selected_files)
      map("n", "<CR>", open_selected_files)
      return true
    end,
  }
end

vim.keymap.set("n", "<C-p>", find_files_multi, { desc = "Find files (multi-select <CR>)" })

-- Terminals

vim.keymap.set("n", "<leader>t", ":botright 12split | terminal<CR>", { noremap = true, silent = true })

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

-- nvim tree

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "File Explorer" })

-- lsp config

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })

vim.api.nvim_set_keymap("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })

-- nvim tree | tabs command

vim.keymap.set("n", "<A-PageDown>", ":bnext<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<A-PageUp>", ":bprevious<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<A-w>", ":Bdelete!<CR>", { noremap = true, silent = true })

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
