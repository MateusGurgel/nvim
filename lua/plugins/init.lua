return {
  {
    "moll/vim-bbye",
    lazy=false
  },
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
        "html", "css", "python", "go", 
        "typescript", "javascript", "tsx"
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
      require('nvim-tree').setup({
        actions = {
          use_system_clipboard = true,
          change_dir = {
            enable = true,
            global = false,
          },
        },
        view = {
          width = 40,
          side = 'left',
          preserve_window_proportions = true,
        }
      })
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "tailwindcss-language-server",
        "typescript-language-server",
        "eslint-lsp",
        "prettierd"
      }
    }
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function ()
      return require "configs.null-ls"
    end
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
    config = function ()
      require("nvim-ts-autotag").setup()
    end
  }
}
