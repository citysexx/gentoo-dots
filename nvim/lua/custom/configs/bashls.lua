local lspconfig = require("lspconfig")

lspconfig.bashls.setup({
  on_attach = function()
    vim.notify("🟢 Bash LS attached")
  end,
})

