--return {}
return {
  "folke/flash.nvim",
  event = "VeryLazy",
  vscode = true,
  ---@type Flash.Config
  opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    -- DM: Changing default 'S' to 'Z' so it does not clash with Surround.nvim (would have preferred "<leader>S" but can't get that to work.
    { "Z", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },

    -- Simulate nvim-treesitter incremental selection
    -- DM: Can't use the default <c-space> as that clashes with ChrisToomey Tmux navigation
    -- Using 'c-x' may mean i lose completion and window scroll as its a special seq, but i can live without:  https://neovim.io/doc/user/insert.html#i_CTRL-X
    { "<c-x>", mode = { "n", "o", "x" },
      function()
        require("flash").treesitter({
          actions = {
            -- DM: Can't use the default <c-space> as that clashes with ChrisToomey Tmux navigation
            ["<c-x>"] = "next",
            ["<BS>"] = "prev"
           -- ["<c-space>"] = "next",
           -- ["<BS>"] = "prev"
          }
        })
      end, desc = "Treesitter Incremental Selection" },
  },
}
