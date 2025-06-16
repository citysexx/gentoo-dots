local lspconfig = require("lspconfig")

lspconfig.jsonnet_ls.setup({
  on_attach = function()
    vim.notify("{} jsonnet LS attached")
  end,
})
