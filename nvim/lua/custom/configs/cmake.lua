local lspconfig = require("lspconfig")

lspconfig.cmake.setup({
  on_attach = function()
    vim.notify(" Cmake LS attached")
  end,
})
