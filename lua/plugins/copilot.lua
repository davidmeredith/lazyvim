return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "BufReadPost",
  opts = {
    suggestion = {
      enabled = not vim.g.ai_cmp,
      auto_trigger = true,
      hide_during_completion = vim.g.ai_cmp,
      keymap = {
        accept = false, -- handled by nvim-cmp / blink.cmp
        next = "<M-]>",
        prev = "<M-[>",
      },
    },
    panel = { enabled = false },
    filetypes = {
      markdown = false,
      help = false,
      javascript = true,
      typescript = true,
      java = true,
      rust = true,
      go = true,
      bash = true,
      sql = true,
      env = true,
      json = true,
      lua = true,
      yaml = true,
      ["*"] = false, -- disable for all other filetypes and ignore default `filetypes`
    },
  },
}
