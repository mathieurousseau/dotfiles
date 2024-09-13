-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },
  -- {
  --   'nvim-tree/nvim-tree.lua',
  --   version = '*',
  --   lazy = false,
  --   -- dependencies = {
  --   --   "nvim-tree/nvim-web-devicons",
  --   -- },
  --   config = function()
  --     require('nvim-tree').setup {
  --       diagnostics = {
  --         enable = true,
  --         show_on_dirs = true,
  --       },
  --     }
  --   end,
  --   keys = {
  --     { '<leader>tt', '<cmd>NvimTreeOpen<cr>',   desc = 'tree-open' },
  --     { '<leader>th', '<cmd>NvimTreeToggle<cr>', desc = 'tree-toggle' },
  --   },
  -- },
  {
    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },
  -- {
  --   'nvim-lualine/lualine.nvim',
  --   dependencies = { 'WhoIsSethDaniel/lualine-lsp-progress.nvim' },
  --   config = function()
  --     local lualine = require 'lualine'
  --
  --     local theme = require 'lualine.themes.modus-vivendi'
  --     theme.normal.c.bg = '#272822'
  --     theme.insert.c.bg = '#272822'
  --     theme.visual.c.bg = '#272822'
  --     theme.replace.c.bg = '#272822'
  --     theme.command.c.bg = '#272822'
  --     theme.inactive.c.bg = '#272822'
  --
  --     local lsp_servers = require('lualine.component'):extend()
  --
  --     function lsp_servers:init(options)
  --       options.icon = options.icon or '󰌘'
  --       options.separator = options.separator or ' '
  --       options.color = { fg = '#ffaa88', gui = 'italic,bold' }
  --       options.padding = 0
  --       lsp_servers.super.init(self, options)
  --     end
  --
  --     function lsp_servers:update_status()
  --       local buf_clients = vim.lsp.get_clients()
  --       local null_ls_installed, null_ls = pcall(require, 'null-ls')
  --       local buf_client_names = {}
  --       for _, client in pairs(buf_clients) do
  --         if client.name == 'null-ls' then
  --           if null_ls_installed then
  --             for _, source in ipairs(null_ls.get_source { filetype = vim.bo.filetype }) do
  --               table.insert(buf_client_names, source.name)
  --             end
  --           end
  --         else
  --           table.insert(buf_client_names, client.name)
  --         end
  --       end
  --       return table.concat(buf_client_names, self.options.separator)
  --     end
  --
  --     lualine.setup {
  --       options = {
  --         icons_enabled = true,
  --         theme = theme,
  --         component_separators = '',
  --         section_separators = '',
  --       },
  --       tabline = {
  --         lualine_a = { 'buffers' },
  --         lualine_z = { 'tabs' },
  --       },
  --       sections = {
  --         lualine_a = { 'mode' },
  --         lualine_b = { 'branch', 'diff' },
  --         lualine_c = {
  --           {
  --             'filename',
  --             file_status = true,
  --             newfile_status = false,
  --             path = 1,
  --             -- Shortens path to leave 40 spaces in the window
  --             shorting_target = 40,
  --             symbols = {
  --               modified = '(modified)',
  --               readonly = '(readonly)',
  --               unnamed = '[No Name]',
  --               newfile = '[New]',
  --             },
  --           },
  --         },
  --         lualine_x = {
  --           {
  --             'diagnostics',
  --             sections = { 'error', 'warn', 'info', 'hint' },
  --
  --             diagnostics_color = {
  --               -- Same values as the general color option can be used here.
  --               error = 'DiagnosticError',
  --               warn = 'DiagnosticWarn',
  --               info = 'DiagnosticInfo',
  --               hint = 'DiagnosticHint',
  --             },
  --             symbols = { error = 'Err ', warn = 'Warn ', info = 'Info ', hint = 'Hint ' },
  --             colored = true,
  --             update_in_insert = false,
  --             always_visible = false,
  --           },
  --           lsp_servers,
  --           {
  --             'filetype',
  --             colored = true,
  --             padding = { left = 0, right = 1 },
  --             icon = { align = 'right' },
  --           },
  --         },
  --         lualine_y = { 'progress' },
  --         lualine_z = { 'location' },
  --       },
  --       inactive_sections = {
  --         lualine_a = {},
  --         lualine_b = {},
  --         lualine_c = { 'filename' },
  --         lualine_x = { 'location' },
  --         lualine_y = {},
  --         lualine_z = {},
  --       },
  --       winbar = {
  --         -- lualine_a = {},
  --         lualine_b = {
  --           {
  --             'navic',
  --             color_correction = nil,
  --             navic_opts = nil,
  --             color = { bg = '#272822', fg = '#949494' },
  --           },
  --         },
  --         -- lualine_c = {
  --         -- },
  --         --   lualine_x = {},
  --         --   lualine_y = {},
  --         --   lualine_z = {}
  --       },
  --       inactive_winbar = {
  --         --   lualine_a = {},
  --         --   lualine_b = {},
  --         lualine_c = {
  --           {
  --             'filename',
  --             color = { fg = '#8c8c89', gui = 'italic,bold' },
  --             file_status = true,
  --             newfile_status = false,
  --             path = 1,
  --             shorting_target = 40,
  --             symbols = {
  --               modified = '(modified)',
  --               readonly = '(readonly)',
  --               unnamed = '[No Name]',
  --               newfile = '[New]',
  --             },
  --           },
  --         },
  --         --   lualine_x = {},
  --         --   lualine_y = {},
  --         --   lualine_z = {}
  --       },
  --     }
  --   end,
  -- },
  {
    'vim-test/vim-test',
    config = function()
      vim.cmd [[
        function! BufferTermStrategy(cmd)
          exec 'te ' . a:cmd
        endfunction

        let g:test#custom_strategies = {'bufferterm': function('BufferTermStrategy')}
        let g:test#strategy = 'bufferterm'
      ]]
    end,
    keys = {
      { '<leader>Tf', '<cmd>TestFile<cr>',    silent = true, desc = 'Run this file' },
      { '<leader>Tn', '<cmd>TestNearest<cr>', silent = true, desc = 'Run nearest test' },
      { '<leader>Tl', '<cmd>TestLast<cr>',    silent = true, desc = 'Run last test' },
    },
  },
  {
    'stevearc/oil.nvim',
    lazy = false,
    opts = {},
    -- dependencies = { 'nvim-tree/nvim-web-devicons' },
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
  },
  {
    'mfussenegger/nvim-lint',
    config = function()
      local lint = require 'lint'

      lint.linters_by_ft = {
        elixir = { 'credo' },
      }

      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },

  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        lua = { 'lua_ls' },
        -- javascript = { { 'prettierd', 'prettier' }, { 'eslint_d', 'eslint' } },
        -- typescript = { { 'prettierd', 'prettier' }, { 'eslint_d', 'eslint' } },
      },
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
  },
  {
    'folke/persistence.nvim',
    event = 'BufReadPre', -- this will only start session saving when an actual file was opened
    opts = {
      -- add any custom options here
    },
  },
  {
    'folke/trouble.nvim',
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
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
  },
  {
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('aerial').setup {
        -- optionally use on_attach to set keymaps when aerial has attached to a buffer
        on_attach = function(bufnr)
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
          vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
        end,
      }
      vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>')
    end,
  },
  -- { 'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons' },
  {
    'echasnovski/mini.diff',
    event = 'VeryLazy',
    keys = {
      {
        '<leader>go',
        function()
          require('mini.diff').toggle_overlay(0)
        end,
        desc = 'Toggle mini.diff overlay',
      },
    },
    opts = {
      view = {
        style = 'sign',
        signs = {
          add = '▎',
          change = '▎',
          delete = '',
        },
      },
    },
  },
  {
    'RRethy/vim-illuminate',
  },
}
