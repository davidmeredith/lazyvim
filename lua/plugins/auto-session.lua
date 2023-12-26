return {
  -- TODO
  -- https://github.com/github/copilot.vim

  -- Session Management
  -- Auto-Session by default stores sessions in vim.fn.stdpath('data').."/sessions/"
  -- 1. When starting nvim with NO args, auto-session will try to restore an existing
  --    session for the cwd if one exists.
  -- 2. When starting nvim WITH an arg 'nvim .', auto-session will do nothing.
  --   3. After starting nvim with an arg, a session can still be manually restored by running :SessionRestore.
  -- 3. Any session saving and restoration takes into consideration the current working directory cwd.
  -- 4. When piping to nvim, e.g: cat myfile | nvim, auto-session behaves like #2.
  --
  -- Now when the user changes the cwd with :cd some/new/dir auto-session handles it gracefully,
  -- saving the current session so there aren't losses and loading the session for the upcoming cwd if it exists.
  {
    "rmagatti/auto-session",
    enabled = true,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("auto-session").setup({
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
        -- Ciaron: set use_git_branch to true, auto-session errors if
        -- i've swapped branches and the file doesn't exist
        auto_session_use_git_branch = true,
        auto_session_enable_last_session = false,
        pre_save_cmds = { "tabdo Neotree close" },
        save_extra_cmds = {
          function()
            return [[echo "Session Saved"]]
          end,
        },
      })
    end,
  },
}
