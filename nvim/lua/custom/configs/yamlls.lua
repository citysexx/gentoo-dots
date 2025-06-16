local lspconfig = require("lspconfig")

lspconfig.yamlls.setup({
  on_attach = function()
    vim.notify("🟡 YAML LS attached")
  end,
})
