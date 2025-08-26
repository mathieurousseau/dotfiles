return {
  'akinsho/bufferline.nvim',
  event = "VeryLazy",

  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  keys = {
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>",            desc = "Toggle Pin" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
    { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>",          desc = "Delete Other Buffers" },
    { "<leader>br", "<Cmd>BufferLineCloseRight<CR>",           desc = "Delete Buffers to the Right" },
    { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>",            desc = "Delete Buffers to the Left" },
    { "<S-h>",      "<cmd>BufferLineCyclePrev<cr>",            desc = "Prev Buffer" },
    { "<S-l>",      "<cmd>BufferLineCycleNext<cr>",            desc = "Next Buffer" },
    { "[b",         "<cmd>BufferLineCyclePrev<cr>",            desc = "Prev Buffer" },
    { "]b",         "<cmd>BufferLineCycleNext<cr>",            desc = "Next Buffer" },
    { "[B",         "<cmd>BufferLineMovePrev<cr>",             desc = "Move buffer prev" },
    { "]B",         "<cmd>BufferLineMoveNext<cr>",             desc = "Move buffer next" },
    { "<leader>bd", "<cmd>bp|sp|bn|bd<cr>",                    desc = "Delete Buffer" },
  },
  config = function()
    local bufferline = require("bufferline")
    local selected_bg = "#2e4f67"
    local selected_fg = "#d18c61"
    local red = "#ff0000"
    local green = "#40FF40"

    bufferline.setup({

      options = {
        -- indicator = { style = "underline" },
        separator_style = "slope",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local s = " "
          for e, n in pairs(diagnostics_dict) do
            local sym = e == "error" and ""
                or (e == "warning" and "" or "")
            s = s .. n .. sym
          end
          return s
        end,
        always_show_bufferline = true,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        }

      },
      highlights = {
        -- 	fill = {
        -- 		fg = "#ffffff",
        -- 		bg = "#1e1e2e",
        -- 	},
        duplicate_selected = {
          --   -- 		bg = "#1e1e2e",
          fg = selected_fg,
          bg = selected_bg,
        },
        buffer_selected = {
          fg = selected_fg,
          bg = selected_bg,
        },
        -- buffer_visible = {
        --   fg = green,
        --   bg = green,
        -- },
        separator_selected = {
          bg = selected_bg
        },
        numbers_selected = {
          bg = selected_bg
        },
        -- separator = {
        --   bg = red,
        --   fg = blue,
        -- },
        -- diagnostic = {
        --   bg = selected
        -- },
        -- hint = {
        --   fg = red,
        --   sp = blue,
        -- },
        -- hint_selected = {
        --   fg = red,
        --   sp = blue,
        -- },
        -- warning = {
        --   fg = red,
        --   sp = blue,
        -- },
        -- warning_selected = {
        --   fg = red,
        --   sp = blue,
        -- },
        -- error = {
        --   fg = red,
        --   sp = blue,
        -- },
        -- error_selected = {
        --   fg = red,
        --   sp = blue,
        -- },
        diagnostic_selected = {
          bg = selected_bg
        },

        hint_diagnostic_selected = {
          bg = selected_bg
        },
        hint_selected = {
          bg = selected_bg
        },
        info_selected = {
          bg = selected_bg
        },
        error_selected = {
          bg = selected_bg
        },
        error_diagnostic_selected = {
          bg = selected_bg
        },
        warning_diagnostic_selected = {
          bg = selected_bg
        },
        warning_selected = {
          bg = selected_bg
        },
        info_diagnostic_selected = {
          bg = selected_bg
        },
        close_button_selected = {
          bg = selected_bg
        },
        modified_selected = {
          bg = selected_bg
        }
        -- 	-- separator_visible = {
        -- 	-- 	bg = "#1e1e2e",
        -- 	-- 	fg = "#1e1e2e",
        -- 	-- },
      },
      -- }
      -- end
    })
  end
}
