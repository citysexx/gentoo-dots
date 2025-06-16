local lspconfig = require("lspconfig")

lspconfig.ada_ls.setup({
  on_attach = function()
    vim.notify("🟢 ADA LS attached")
  end,
})

