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
    { "<leader>bd", "<cmd>b#|bd#<cr>",                         desc = "Delete Buffer" },
  },
  config = function()
    local bufferline = require("bufferline")
    -- local selected = "#00ff00"
    local selected = "#6c5382"
    local red = "#ff0000"
    local blue = "#0000ff"
    -- local green = "00ff00"

    bufferline.setup({

      -- vim.opt.termguicolors = true,
      -- config = function()
      -- vim.opt.termguicolors = true
      -- require("bufferline").setup {
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
        -- background = {
        --   -- 		bg = "#1e1e2e",
        --   -- fg = red,
        --   bg = blue
        -- },
        buffer_selected = {
          -- fg = red,
          bg = selected,
        },
        -- buffer_visible = {
        --   fg = green,
        --   bg = green,
        -- },
        separator_selected = {
          -- fg = green,
          bg = selected
        },
        numbers_selected = {
          bg = selected
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
          bg = selected
        },

        hint_diagnostic_selected = {
          bg = selected
        },
        hint_selected = {
          bg = selected
        },
        info_selected = {
          bg = selected
        },
        error_selected = {
          bg = selected
        },
        error_diagnostic_selected = {
          bg = selected
        },
        warning_diagnostic_selected = {
          bg = selected
        },
        warning_selected = {
          bg = selected
        },
        info_diagnostic_selected = {
          bg = selected
        },
        close_button_selected = {
          bg = selected
        },
        modified_selected = {
          bg = selected
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
