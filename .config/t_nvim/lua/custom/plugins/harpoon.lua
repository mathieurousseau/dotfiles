return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    vim.keymap.set("n", ";", function() harpoon:list():add() end)
    vim.keymap.set("n", "<D-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    vim.keymap.set("n", "<D-a>", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<D-s>", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<D-d>", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<D-f>", function() harpoon:list():select(4) end)

    -- Toggle previous & next buffers stored within Harpoon list
    -- vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
    -- vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
  end
}
