return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  opts = {
    -- img-clip only reads these options from `default` (or a per-filetype table)
    default = {
      dir_path = "attachments",
      use_absolute_path = false,
      relative_to_current_file = true,
    },
  },
  keys = {
    -- suggested keymap
    { "<leader>ip", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
  },
}
