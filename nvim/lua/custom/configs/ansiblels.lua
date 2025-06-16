local lspconfig = require("lspconfig")

lspconfig.ansiblels.setup({
  on_attach = function()
    vim.notify("🟢 Ansible LS attached")
  end,
})

