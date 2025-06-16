local lspconfig = require("lspconfig")

lspconfig.gitlab_ci_ls.setup({
  on_attach = function()
    vim.notify("🟢 Gitlab CI LS attached")
  end,
})
