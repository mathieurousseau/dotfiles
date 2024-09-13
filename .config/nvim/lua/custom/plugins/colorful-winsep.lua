return {
  {
    "nvim-zh/colorful-winsep.nvim",
    -- config = true,
    event = { "WinLeave" },
    config = function()
      require("colorful-winsep").setup({
        no_exec_files = { "packer", "TelescopePrompt", "mason", "CompetiTest", "NvimTree", "Noice" },

        symbols = { "━", "┃", "┏", "┓", "┗", "┛" },
        only_line_seq = true,
        position = 'center', -- 'top', 'bot', 'topbot', 'all',

        anchor = {
          left = { height = 1, x = -1, y = -1 },
          right = { height = 1, x = -1, y = 0 },
          up = { width = 0, x = -1, y = 0 },
          bottom = { width = 0, x = 1, y = 0 },
        }
      })
    end
  }
}
