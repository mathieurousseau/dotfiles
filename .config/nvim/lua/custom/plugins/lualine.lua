return {
  -- dir = '~/Projects/lualine.nvim/',
  'mathieurousseau/lualine.nvim',
  config = function()
    require('lualine').setup {
      options           = {
        icons_enabled = true,
        theme = 'kanagawa-dragon',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections          = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { { 'filename', path = 1 } }
      },
      tabline           = {},
      winbar            = {
        -- lualine_a = { 'mode' },
        -- lualine_b = { 'branch', 'diff', 'diagnostics' },
        -- lualine_c = { 'filename' },
        -- lualine_x = { 'filetype' },
        -- lualine_y = { 'progress' },
        -- lualine_z = { 'location' }

        -- lualine_a = { 'filename' },
        -- lualine_b = { 'diagnostics' },
        -- lualine_c = {},
        -- lualine_x = {},
        -- lualine_y = {},
        -- lualine_z = {}
      },
      inactive_winbar   = {
        -- lualine_a = {},
        -- lualine_b = {},
        -- lualine_c = {},
        -- lualine_x = {},
        -- lualine_y = { 'filename' },
        -- lualine_z = { 'diagnostics' }
      },
      extensions        = {}
    }
  end
}
