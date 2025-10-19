local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = {"black", "isort", "ruff_fix", "ruff_format", "mypy" }
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  format_on_save = {
     timeout_ms = 500,
     lsp_fallback = true,
  },

  on_attach = function (client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group=augroup,
        buffer=bufnr
      })

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function(args)
          require("conform").format({ bufnr = args.buf })
        end,
      })

    end

  end

}

return options
