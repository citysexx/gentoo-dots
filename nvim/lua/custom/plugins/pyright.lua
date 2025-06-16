local lspconfig = require("lspconfig")

lspconfig.pyright.setup({
  on_attach = function()
    vim.notify("🔧 pyright manually attached")
  end,
})
