return {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  config = function()
    --require("nvim-surround").setup()
    require("nvim-surround").setup({
      -- Configuration here, or leave empty to use defaults
      -- DM: note potential for conflict keymap between S (flash vs surroud)
      keymaps = {
        insert = "<C-g>s",
        insert_line = "<C-g>S",
        normal = "ys",
        normal_cur = "yss",
        normal_line = "yS",
        normal_cur_line = "ySS",
        --visual = "<leader>S", -- default: visual = "S" (clashes with flash.nvim search)
        visual = "S",
        visual_line = "gS",
        delete = "ds",
        change = "cs",
        change_line = "cS",
      },
    })
  end,
}

-- In visual mode: select the text you want to surround, then S<surroundChar> e.g. S"
-- The three "core" operations of add/delete/change can be done with the
-- keymaps ys{motion}{char}, ds{char}, and cs{target}{replacement},
-- respectively. For the following examples, * will denote the cursor position:
--
--    Old text                    Command         New text
----------------------------------------------------------------------------------
--    surr*ound_words             ysiw)           (surround_words)
--    *make strings               ys$"            "make strings"
--    [delete ar*ound me!]        ds]             delete around me!
--    remove <b>HTML t*ags</b>    dst             remove HTML tags
--    'change quot*es'            cs'"            "change quotes"
--    <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
--    delete(functi*on calls)     dsf             function calls
