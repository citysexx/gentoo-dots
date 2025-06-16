local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
  on_attach = function()
    vim.notify("🟣 Lua LS attached")
  end,
})

