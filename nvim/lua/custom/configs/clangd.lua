local lspconfig = require("lspconfig")

lspconfig.clangd.setup({
  on_attach = function()
    vim.notify("🟢 Clangd LS attached")
  end,
})
