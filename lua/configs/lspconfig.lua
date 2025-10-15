-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()


local servers = { "html", "cssls", "pyright", "ruff", "tsserver", "tailwindcss", "eslint"}

-- lsps with default config
for _, lsp in ipairs(servers) do
  vim.lsp.enable(lsp)
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
