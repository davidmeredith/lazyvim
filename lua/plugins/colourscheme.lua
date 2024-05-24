-- colour scheme hould be  available  when starting neovim
--return {
--  "ellisonleao/gruvbox.nvim",
--  enabled = false,
--  priority = 500, -- make sure to load this before all the other start plugins
--  config = function()
--    require("gruvbox").setup({
--      -- palette_overrides = {
--      --     bright_green = "#990000",
--      -- }
--    })
--    vim.cmd([[colorscheme gruvbox]])
--  end,
--}

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

--return {
--  "folke/tokyonight.nvim",
--  lazy = true,
--  opts = { style = "moon" },
--}

return {
  {
    "catppuccin",
    opts = {
      -- https://www.reddit.com/r/neovim/comments/18eobbj/transparency_catppuccin_with_lazyvim_not_working/
      transparent_background = false,
      flavour = "frappe",
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}

--return {
--  "catppuccin/nvim",
--  lazy = true,
--  name = "catppuccin",
--  -- Where to put catppuccin config is lazyvim
--  -- https://www.reddit.com/r/neovim/comments/12eylee/where_to_put_catppuccin_configuration/
--  -- config = function()
--  --   require("catppuccin").setup({
--  --     transparent_background = true,
--  --     flavour = "latte",
--  --   })
--  --   --vim.cmd([[colorscheme catppuccin]])
--  -- end,
--  --
--  opts = {
--    flavour = "latte",
--    transparent_background = true,
--    integrations = {
--      aerial = true,
--      alpha = true,
--      cmp = true,
--      dashboard = true,
--      flash = true,
--      gitsigns = true,
--      headlines = true,
--      illuminate = true,
--      indent_blankline = { enabled = true },
--      leap = true,
--      lsp_trouble = true,
--      mason = true,
--      markdown = true,
--      mini = true,
--      native_lsp = {
--        enabled = true,
--        underlines = {
--          errors = { "undercurl" },
--          hints = { "undercurl" },
--          warnings = { "undercurl" },
--          information = { "undercurl" },
--        },
--      },
--      navic = { enabled = true, custom_bg = "lualine" },
--      neotest = true,
--      neotree = true,
--      noice = true,
--      notify = true,
--      semantic_tokens = true,
--      telescope = true,
--      treesitter = true,
--      treesitter_context = true,
--      which_key = true,
--    },
--  },
--
--  {
--    "LazyVim/LazyVim",
--    opts = {
--      colorscheme = "catppuccin",
--    },
--  },
--}
