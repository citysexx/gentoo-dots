return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "pyright", "lua_ls" },
        automatic_installation = true,
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- 💥 Force pyright manually
      lspconfig.pyright.setup({
        capabilities = capabilities,
        on_attach = function()
          vim.notify("🔥 pyright attached", vim.log.levels.INFO)
        end,
      })

      -- Optional: Lua LS
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
    end,
  },
}
