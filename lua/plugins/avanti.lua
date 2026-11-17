return {
  "yetone/avante.nvim",

  -- To edit the Avante sidebar
  -- ===========================
  -- e.g. you want to delete selected generated output but keep useful history,
  -- put the cursor into the sidebar then:
  --   :setlocal modifiable
  --   :setlocal nonmodifiable
  --
  -- Optional: For above, add a keymap to conf (init.lua or Avante setup)
  -- to quickly unlock/lock the current buffer:
  --vim.keymap.set("n", "<leader>um", function()
  --  vim.bo.modifiable = not vim.bo.modifiable
  --  print("Buffer modifiable: " .. tostring(vim.bo.modifiable))
  --end, { desc = "Toggle buffer modifiable" })
  --
  -- To fix the E382: Cannot write, 'buftype' option is set error in Vim,
  -- reset the buffer type to normal with: ':set buftype=' (then save).

  -- Building from src
  -- ===================
  -- DM: I had to force avante to build from source
  -- AI says: Prebuilt binary downloads often fail due to network restrictions, system architecture
  -- mismatches, or missing libc dependencies. Compiling directly from source using Cargo fixes this.
  -- Open your terminal and navigate to your avante.nvim plugin installation directory:
  --   For lazy.nvim: `cd ~/.local/share/nvim/lazy/avante.nvim`
  --   then run: `make BUILD_FROM_SOURCE=true`
  --
  -- If the compilation fails, it is usually because rustc or cargo is out of date.
  -- Update your Rust toolchain to the latest stable version:
  -- run: rustup update
  --
  -- If you use lazy.nvim, ensure your plugin specification forces compilation from source so
  -- it handles future updates automatically (make BUILD_FROM_SOURCE=true)
  build = vim.fn.has("win32") ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    or "make BUILD_FROM_SOURCE=true", -- Forces building locally with cargo
  event = "VeryLazy",
  opts = {
    -- add any opts here
    -- this file can contain specific instructions for your project
    windows = {
      edit = {
        border = "solid", -- Options: "rounded", "single", "double", "solid", etc.
      },
      ask = {
        border = "rounded",
      },
    },

    instructions_file = "avante.md",
    -- for example
    provider = "gemini",
    providers = {
      -- If you add multiple blocks inside providers = { ... }, you can switch between
      -- them live inside Neovim at any time without restarting by running :AvanteSwitchProvider
      gemini = {
        model = "gemini-3.8-flash",
        extra_request_body = {
          temperature = 0,
          max_tokens = 8192,
        },
      },
      ollama = {
        -- To run/stop/show ollama locally, first install with brew, then:
        -- brew services
        -- brew services start ollama
        -- brew services stop ollama
        -- brew services info ollama
        endpoint = "http://127.0.0.1:11434",
        model = "qwen2.5-coder:7b",
        extra_request_body = {
          options = {
            num_ctx = 32768, -- Larger context window helps with file edits
            temperature = 0,
          },
        },
      },
      claude = {
        endpoint = "https://api.anthropic.com",
        --model = "claude-sonnet-4-20250514",
        model = "claude-sonnet-5-5",
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
        model = "Qwen/Qwen3-235B-A22B-Instruct-2507-FP8",
        api_key_name = "OSPREY_KEY",
        timeout = 30000, -- Timeout in milliseconds
      },
    },
  },
  mappings = {

    -- Add boarder around the avante sidebar
    vim.api.nvim_set_hl(0, "AvanteSidebarWinSeparator", { link = "AvanteSidebarWinHorizontalSeparator" }),
  },
  --  dependencies = {
  --    "nvim-lua/plenary.nvim",
  --    "MunifTanjim/nui.nvim",
  --    {
  --      "ColinKennedy/mega.cmdparse",
  --      dependencies = {
  --        "ColinKennedy/mega.logging",
  --      },
  --    },
  --    --- The below dependencies are optional,
  --    "nvim-mini/mini.pick", -- for file_selector provider mini.pick
  --    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
  --    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
  --    "ibhagwan/fzf-lua", -- for file_selector provider fzf
  --    "stevearc/dressing.nvim", -- for input provider dressing
  --    "folke/snacks.nvim", -- for input provider snacks
  --    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
  --    "zbirenbaum/copilot.lua", -- for providers='copilot'
  --
  --    {
  --      -- support for image pasting
  --      "HakonHarnes/img-clip.nvim",
  --      event = "VeryLazy",
  --      opts = {
  --        -- recommended settings
  --        default = {
  --          embed_image_as_base64 = false,
  --          prompt_for_file_name = false,
  --          drag_and_drop = {
  --            insert_mode = true,
  --          },
  --          -- required for Windows users
  --          use_absolute_path = true,
  --        },
  --      },
  --    },
  --    {
  --      -- Make sure to set this up properly if you have lazy=true
  --      "MeanderingProgrammer/render-markdown.nvim",
  --      opts = {
  --        file_types = { "markdown", "Avante" },
  --      },
  --      ft = { "markdown", "Avante" },
  --    },
  --  },
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
