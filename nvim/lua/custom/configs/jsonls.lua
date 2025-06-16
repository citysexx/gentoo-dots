local lspconfig = require("lspconfig")

lspconfig.jsonls.setup({
  on_attach = function()
    vim.notify("🔶 JSON LS attached")
  end,
})

