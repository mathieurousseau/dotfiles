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
        view_options = {
          show_hidden = true,
        }
      }
    end
  }
}
