return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
   	  ensure_installed = {
   		  "vim", "lua", "vimdoc",
        "html", "css", "python", "go", "typescript"
   		},
   	},
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('telescope').setup{}
      end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup()
      vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'File Explorer' })
    end,
  }
}
