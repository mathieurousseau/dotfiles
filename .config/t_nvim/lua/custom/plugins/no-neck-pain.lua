return {
  'shortcuts/no-neck-pain.nvim',

  keys = {
    { "<leader>nn", "<Cmd>NoNeckPain<CR>",           desc = "No Neck Pain" },
    { "<leader>ns", "<Cmd>NoNeckPainScratchPad<CR>", desc = "No Neck Pain ScratchPad" },
  },

  config = function()
    require('no-neck-pain').setup({
      buffers = {
        right = {
          enabled = false,
        },
        scratchPad = {
          -- set to `false` to
          -- disable auto-saving
          enabled = true,

          -- set to `nil` to default
          -- to current working directory
          -- location = "~/Documents/",
          location = nil,
          fileName = "scratchpad",
        },
        bo = {
          filetype = "md"
        },
      },
    })
  end
}
