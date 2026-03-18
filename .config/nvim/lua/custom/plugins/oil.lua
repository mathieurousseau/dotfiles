return {
  {
    'stevearc/oil.nvim',
    lazy = true,
    opts = {},
    keys = {
      { '-', '<cmd>Oil<cr>', desc = 'Open parent directory' },
    },
    config = function()
      require("oil").setup {
        watch_for_changes = true,
        keymaps = {
          ["<C-h>"] = false,
          ["<C-l>"] = false,
          ["_"] = false,
        },
        view_options = {
          show_hidden = true,
        }
      }
    end
  }
}
