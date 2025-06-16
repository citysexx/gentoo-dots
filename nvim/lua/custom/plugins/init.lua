-- This loads all your plugin definition files
return {
  unpack(require("custom.plugins.lsp")),
  unpack(require("custom.plugins.null-ls")),
}
