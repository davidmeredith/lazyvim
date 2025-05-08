-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Dave's customisations that override the Kickstart defaults.
vim.o.wrap = true
vim.o.spelllang = "en_gb"
vim.o.conceallevel = 1 -- Needed for LazyVim
vim.o.relativenumber = false
vim.opt.winbar = "%=%m %f"

-- DM: these don't seem to be working
--local float_border = { focusable = true, style = "minimal", border = "single" }
local float_border = { border = "single" } -- Use a sharp border with `FloatBorder` highlights
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, float_border)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, float_border)
vim.diagnostic.config({
  float = { float_border },
})

--local lspconfig = require("nvim-lspconfig")
--lspconfig.rustowlsp.setup({})
