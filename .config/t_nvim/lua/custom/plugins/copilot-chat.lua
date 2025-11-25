return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },                       -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken",                          -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
      window = {
        width = 0.4
      },
      mappings = {
        complete = {
          insert = '<Tab>',
        },
        close = {
          normal = 'q',
          insert = '<C-c>',
        },
        reset = {
          normal = '<C-l>',
          insert = '<C-l>',
        },
        submit_prompt = {
          normal = '<CR>',
          insert = '<C-s>',
        },
        toggle_sticky = {
          normal = 'grr',
        },
        clear_stickies = {
          normal = 'grx',
        },
        accept_diff = {
          normal = '<C-y>',
          insert = '<C-y>',
        },
        jump_to_diff = {
          normal = 'gj',
        },
        quickfix_answers = {
          normal = 'gqa',
        },
        quickfix_diffs = {
          normal = 'gqd',
        },
        yank_diff = {
          normal = 'gay',
          register = '"', -- Default register to use for yanking
        },
        show_diff = {
          normal = 'gad',
          full_diff = false, -- Show full diff instead of unified diff when showing diff window
        },
        show_info = {
          normal = 'gai',
        },
        show_context = {
          normal = 'gac',
        },
        show_help = {
          normal = 'gah',
        },
      },
    },
    keys = {
      { '<leader>cc', '<cmd>CopilotChat<cr>', desc = 'CopilotChat' },
    },

    -- See Commands section for default commands if you want to lazy load on them
  },
}
