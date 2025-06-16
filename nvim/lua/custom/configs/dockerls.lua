local lspconfig = require("lspconfig")

lspconfig.dockerls.setup({
  on_attach = function()
    vim.notify("🐳 Docker LS attached")
  end,
})

