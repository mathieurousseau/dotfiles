return {
  {
    'akinsho/flutter-tools.nvim',
    lazy = true,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = true,
    keys = {
      { "<leader>fr", "<Cmd>FlutterReload <CR>",          desc = "[F]utter reload" },
      { "<leader>fR", "<Cmd>FlutterRestart <CR>",         desc = "[F]utter Restart" },
      { "<leader>fa", "<Cmd>FlutterAttach <CR>",          desc = "[F]utter Attach" },
      { "<leader>fp", "<Cmd>FlutterCopyProfilerUrl <CR>", desc = "[F]utter Profiler URL" },
      { "<leader>fc", "<Cmd>FlutterLogClear <CR>",        desc = "[F]utter Clear Logs" },
      { "<leader>fl", "<Cmd>FlutterLogToggle <CR>",       desc = "[F]utter Logs" },

    }

  }
}
