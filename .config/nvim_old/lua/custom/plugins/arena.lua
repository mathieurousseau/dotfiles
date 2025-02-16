return {
  "dzfrias/arena.nvim",
  event = "BufWinEnter",
  -- Calls `.setup()` automatically
  config = true,
  keys = {
    { "<leader>bb", "<Cmd>ArenaToggle <CR>", desc = "[B]uffer Arena" },

  }
}
