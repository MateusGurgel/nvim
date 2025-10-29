return {
  {
    "tpope/vim-dadbod",
    lazy = true,
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = { "tpope/vim-dadbod" },
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    init = function()
      local cwd = vim.fn.getcwd()
      local project_db_file = cwd .. "/.db_connections.json"
      local global_db_dir = vim.fn.expand "~/.local/share/db_ui"

      if vim.fn.isdirectory(global_db_dir) == 0 then
        vim.fn.mkdir(global_db_dir, "p")
      end

      if vim.fn.filereadable(project_db_file) == 1 then
        vim.g.db_ui_save_location = project_db_file
      else
        vim.g.db_ui_save_location = global_db_dir
      end

      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
  {
    "kristijanhusak/vim-dadbod-completion",
    dependencies = { "tpope/vim-dadbod" },
    ft = { "sql", "mysql", "plsql" },
    config = function()
      local cmp = require "cmp"
      cmp.setup.filetype({ "sql", "mysql", "plsql" }, {
        sources = {
          { name = "vim-dadbod-completion" },
          { name = "buffer" },
        },
      })
    end,
  },
}
