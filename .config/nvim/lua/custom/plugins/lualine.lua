return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = function(_, opts)
    opts.options = opts.options or {
      icons_enabled        = true,
      theme                = 'kanagawa-dragon',
      component_separators = { left = '', right = '' },
      section_separators   = { left = '', right = '' },
      disabled_filetypes   = {
        statusline = {},
        winbar = {},
      },
      ignore_focus         = {},
      always_divide_middle = true,
      globalstatus         = false,

    }

    opts.sections = opts.sections or {}
    opts.sections.lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 1) end } }
    opts.sections.lualine_b = opts.sections.lualine_b or { 'branch', 'diff', 'diagnostics' }
    opts.sections.lualine_c = opts.sections.lualine_c or { { 'filename', path = 1 } }
    opts.sections.lualine_x = opts.sections.lualine_x or {}
    opts.sections.lualine_y = opts.sections.lualine_y or { 'filetype', 'progress' }
    opts.sections.lualine_z = opts.sections.lualine_z or { 'location' }
    local icons = {
      Error = { "", "DiagnosticError" },
      Inactive = { "", "MsgArea" },
      Warning = { "", "DiagnosticWarn" },
      Normal = { "", "Special" },
    }

    -- copilot session status
    table.insert(opts.sections.lualine_x, 1, {
      function()
        local status = require("sidekick.status").cli()
        return "" .. (#status > 1 and #status or "")
      end,
      cond = function()
        return #require("sidekick.status").cli() > 0
      end,
      color = function()
        return { fg = Snacks.util.color("Special") }
      end,
    })

    -- copilot status
    table.insert(opts.sections.lualine_x, 2, {
      function()
        local status = require("sidekick.status").get()
        return status and vim.tbl_get(icons, status.kind, 1)
      end,
      cond = function()
        return require("sidekick.status").get() ~= nil
      end,
      color = function()
        local status = require("sidekick.status").get()
        local hl = status and (status.busy and "DiagnosticWarn" or vim.tbl_get(icons, status.kind, 2))
        -- return { fg = Snacks.util.color(hl) }
        return { fg = Snacks.util.color(hl) }
      end,
    })



    return opts
  end,
}
