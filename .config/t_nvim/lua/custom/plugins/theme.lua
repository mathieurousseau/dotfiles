return {
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    -- 'folke/tokyonight.nvim',
    -- 'EdenEast/nightfox.nvim',
    "rebelot/kanagawa.nvim",
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      -- require('nightfox').setup {
      --   palettes = {
      --     carbonfox = {
      --       -- sel is different types of selection colors.
      --       sel0 = "#6c5382", -- Popup bg, visual selection bg
      --       sel1 = "#6c5382", -- Popup sel bg, search bg
      --     }
      --   }
      -- }
    end,
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      -- vim.cmd.colorscheme 'tokyonight-night'
      vim.cmd.colorscheme 'kanagawa-dragon'
      -- vim.cmd.colorscheme 'main'

      vim.cmd.hi 'Comment gui=none'
      vim.cmd.hi 'DiffAdd gui=none cterm=none'
      vim.cmd.hi 'DiffAdd guibg=#336009 ctermfg=193 ctermbg=22'
      vim.cmd.hi 'DiffChange	gui=none cterm=none'
      vim.cmd.hi 'DiffChange	guibg=#2B5B77 ctermfg=NONE ctermbg=24'
      vim.cmd.hi 'DiffDelete	gui=none cterm=none'

      vim.cmd.hi 'DiffText	guibg=#000000 ctermfg=110 ctermbg=16'
      vim.cmd.hi 'DiffText	gui=reverse cterm=reverse'
      vim.cmd.hi 'DiffText	guifg=#8fbfdc guibg=#000000 ctermfg=110 ctermbg=16'

      vim.cmd.hi 'diffAdded	gui=none cterm=none'
      vim.cmd.hi 'diffAdded	guifg=#d2ebbe guibg=#437019 ctermfg=193 ctermbg=22'
      vim.cmd.hi 'diffRemoved	gui=none cterm=none'
      -- vim.cmd.hi 'diffRemoved	guifg=#b05059 guibg=#40000a ctermfg=16 ctermbg=52'
    end,
  }
}
