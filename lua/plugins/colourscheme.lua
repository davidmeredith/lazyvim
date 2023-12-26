-- colour scheme hould be  available  when starting neovim
return {
  "ellisonleao/gruvbox.nvim",
  enabled = true,
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
