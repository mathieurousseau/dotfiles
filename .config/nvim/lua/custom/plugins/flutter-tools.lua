return {
  {
    'akinsho/flutter-tools.nvim',
    ft = 'dart',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim',
    },
    config = function()
      -- flutter-tools wraps `lsp.settings` inside `dart = { ... }` for dartls,
      -- so provide the flat settings table here.
      require('flutter-tools').setup({
        lsp = {
          settings = {
            lineLength = 120,
          },
        },
      })
    end,
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
