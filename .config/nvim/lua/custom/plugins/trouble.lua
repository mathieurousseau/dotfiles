return {
  {
    'folke/trouble.nvim',
    opts = {
      modes = {
        my_diagnostics = {
          mode = 'diagnostics',
          filter = {
            ['not'] = { severity = vim.diagnostic.severity.INFO },
          },
        },
        info_diagnostics = {
          mode = 'diagnostics',
          filter = function(items)
            return vim.tbl_filter(function(item)
              return item.severity == vim.diagnostic.severity.INFO
            end, items)
          end,
        },
      },
    }, -- for default options, refer to the configuration section for custom setup.
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble my_diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xi',
        '<cmd>Trouble info_diagnostics toggle<cr>',
        desc = 'Diagnostics INFO (Trouble)',
      },

      {
        '<leader>xb',
        '<cmd>Trouble my_diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  }
}
