return {
  {
  'numToStr/FTerm.nvim',
    -- lazy = true,
opts = {   border = 'double',
    dimensions  = {
        height = 0.9,
        width = 0.9,
    }
    },
    keys = {


  {"<A-i>", '<Cmd>lua require("FTerm").toggle()<CR>', desc = "[T]oggle FTerm"},
      { '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', mode = { 't'} },

    }
}
  }
