--return {}
return {
  "yetone/avante.nvim",
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  -- ⚠️ must add this setting! ! !
  build = vim.fn.has("win32") ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    or "make",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  ---@module 'avante'
  ---@type avante.Config
  opts = {
    -- add any opts here
    -- this file can contain specific instructions for your project
    instructions_file = "avante.md",
    -- for example
    provider = "osprey",
    providers = {
      claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-sonnet-4-20250514",
        timeout = 30000, -- Timeout in milliseconds
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 20480,
        },
      },
      moonshot = {
        endpoint = "https://api.moonshot.ai/v1",
        model = "kimi-k2-0711-preview",
        timeout = 30000, -- Timeout in milliseconds
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 32768,
        },
      },
      osprey = {
        __inherited_from = "openai",
        endpoint = "https://stardust-proxy-scp012-dxm01.apps.ocpb.osprey.hartree.stfc.ac.uk",
        model = "Qwen3-235B-A22B-Instruct-2507-FP8",
        api_key_name = "OSPREY_KEY",
        timeout = 30000, -- Timeout in milliseconds
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-mini/mini.pick", -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "stevearc/dressing.nvim", -- for input provider dressing
    "folke/snacks.nvim", -- for input provider snacks
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}

--return {}
-- Now managed by LazyVim :LazyExtras
-- return {
--   "yetone/avante.nvim",
--   event = "VeryLazy",
--   lazy = false,
--   version = false, -- set this if you want to always pull the latest change
--   opts = {
--     -- add any opts here
--   },
--   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
--   build = "make",
--   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
--   dependencies = {
--     "nvim-treesitter/nvim-treesitter",
--     "stevearc/dressing.nvim",
--     "nvim-lua/plenary.nvim",
--     "MunifTanjim/nui.nvim",
--     --- The below dependencies are optional,
--     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
--     "zbirenbaum/copilot.lua", -- for providers='copilot'
--     {
--       -- support for image pasting
--       "HakonHarnes/img-clip.nvim",
--       event = "VeryLazy",
--       opts = {
--         -- recommended settings
--         default = {
--           embed_image_as_base64 = false,
--           prompt_for_file_name = false,
--           drag_and_drop = {
--             insert_mode = true,
--           },
--           -- required for Windows users
--           use_absolute_path = true,
--         },
--       },
--     },
--     {
--       -- Make sure to set this up properly if you have lazy=true
--       "MeanderingProgrammer/render-markdown.nvim",
--       opts = {
--         file_types = { "markdown", "Avante" },
--       },
--       ft = { "markdown", "Avante" },
--     },
--   },
-- }
