return {
  "dzfrias/arena.nvim",
  event = "BufWinEnter",
  -- Calls `.setup()` automatically
  config = true,
  keys = {
    { "<leader>a", "<Cmd>ArenaToggle <CR>", desc = "[B]uffer Arena" },

  }
}
