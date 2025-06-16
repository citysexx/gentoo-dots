local lspconfig = require("lspconfig")

lspconfig.jinja_lsp.setup({
  on_attach = function()
    vim.notify("🟢 ADA LS attached")
  end,
})
