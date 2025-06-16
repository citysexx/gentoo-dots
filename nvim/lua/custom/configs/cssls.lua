local lspconfig = require("lspconfig")

lspconfig.cssls.setup({
  on_attach = function()
    vim.notify("🟢 CSS LS attached")
  end,
})
