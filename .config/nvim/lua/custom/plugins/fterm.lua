return {
  {
    'numToStr/FTerm.nvim',
    -- lazy = true,
    opts = {
      border     = 'double',
      dimensions = {
        height = 0.9,
        width = 0.9,
      }
    },
    keys = {

      { "<A-i>", '<Cmd>lua require("FTerm").toggle()<CR>', desc = "[T]oggle FTerm" },
      { '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>', mode = { 't' } },
      { '<C-n>', '<C-\\><C-n>',                            mode = { 't' } },

    }
  }
}
