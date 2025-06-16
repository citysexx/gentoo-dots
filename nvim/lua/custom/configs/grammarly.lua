local lspconfig = require("lspconfig")

lspconfig.grammarly.setup({
  on_attach = function()
    vim.notify("🟢 Grammarly attached")
  end,
})
