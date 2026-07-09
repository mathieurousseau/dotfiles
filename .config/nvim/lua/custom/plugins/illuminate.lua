return {
  "RRethy/vim-illuminate",
  event = "VeryLazy",
  opts = {
    -- Don't illuminate (and underline) inside snacks prompt/list buffers.
    filetypes_denylist = {
      "dirbuf",
      "dirvish",
      "fugitive",
      "snacks_picker_input",
      "snacks_picker_list",
      "snacks_dashboard",
      "snacks_layout_box",
    },
  },
  config = function(_, opts)
    require("illuminate").configure(opts)
  end,
}
