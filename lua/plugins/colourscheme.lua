-- colour scheme hould be  available  when starting neovim
return {
  "ellisonleao/gruvbox.nvim",
  enabled = false,
  priority = 500, -- make sure to load this before all the other start plugins
  config = function()
    require("gruvbox").setup({
      -- palette_overrides = {
      --     bright_green = "#990000",
      -- }
    })
    vim.cmd([[colorscheme gruvbox]])
  end,
}
--return {
--  -- add gruvbox
--  { "ellisonleao/gruvbox.nvim" },
--
--  -- Configure LazyVim to load gruvbox
--  {
--    "LazyVim/LazyVim",
--    opts = {
--      colorscheme = "gruvbox",
--    },
--  },
--}
