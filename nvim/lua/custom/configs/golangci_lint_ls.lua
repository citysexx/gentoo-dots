local lspconfig = require("lspconfig")

lspconfig.golangci_lint_ls.setup({
  on_attach = function()
    vim.notify("🟢 Golang Ci LS attached")
  end,
})
