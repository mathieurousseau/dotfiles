local sidekick_prev_width

local function toggle_sidekick_full_width()
  local cli = require("sidekick.cli")
  cli.show({ focus = true })

  if require("sidekick.config").cli.win.layout == "float" then
    return
  end

  local states = require("sidekick.cli.state").get({ attached = true, terminal = true })
  local terminal
  for _, state in ipairs(states) do
    if state.terminal and state.terminal:is_open() then
      terminal = state.terminal
      break
    end
  end

  if not terminal or not terminal.win or not vim.api.nvim_win_is_valid(terminal.win) then
    return
  end

  local width = vim.api.nvim_win_get_width(terminal.win)
  local maxish_width = math.floor(vim.o.columns * 0.75)

  if sidekick_prev_width and width >= maxish_width then
    vim.api.nvim_win_set_width(terminal.win, sidekick_prev_width)
    sidekick_prev_width = nil
    return
  end

  sidekick_prev_width = width
  vim.api.nvim_win_call(terminal.win, function()
    vim.cmd("vertical resize 999")
  end)
end

return {
  "folke/sidekick.nvim",
  opts = {
    -- add any options here
    cli = {
      -- win = {
      --   keys = {
      --     nav_down = false,
      --   },
      -- },
      mux = {
        backend = "tmux",
        enabled = true,
      },
      tools = {
        claude = {
          native_scroll = true,
        },
        codex = {
          native_scroll = true,
        }

      },
    },
  },
  keys = {
    {
      "<tab>",
      function()
        -- if there is a next edit, jump to it, otherwise apply it if any
        if not require("sidekick").nes_jump_or_apply() then
          return "<Tab>" -- fallback to normal tab
        end
      end,
      expr = true,
      desc = "Goto/Apply Next Edit Suggestion",
    },
    {
      "<c-,>",
      function() require("sidekick.cli").toggle() end,
      desc = "Sidekick Toggle",
      mode = { "n", "t", "i", "x" },
    },
    {
      "<c-g>",
      toggle_sidekick_full_width,
      desc = "Sidekick Show Full Width",
      mode = { "n", "t" },
    },
    {
      "<leader>aa",
      function() require("sidekick.nes").update() end,
      desc = "Sidekick next NES",
    },
    {
      "<leader>as",
      function() require("sidekick.cli").select() end,
      -- Or to select only installed tools:
      -- require("sidekick.cli").select({ filter = { installed = true } })
      desc = "Select CLI",
    },
    {
      "<leader>ad",
      function() require("sidekick.cli").close() end,
      desc = "Detach a CLI Session",
    },
    {
      "<leader>at",
      function() require("sidekick.cli").send({ msg = "{this}" }) end,
      mode = { "x", "n" },
      desc = "Send This",
    },
    {
      "<leader>af",
      function() require("sidekick.cli").send({ msg = "{file}" }) end,
      desc = "Send File",
    },
    {
      "<leader>av",
      function() require("sidekick.cli").send({ msg = "{selection}" }) end,
      mode = { "x" },
      desc = "Send Visual Selection",
    },
    {
      "<leader>ap",
      function() require("sidekick.cli").prompt() end,
      mode = { "n", "x" },
      desc = "Sidekick Select Prompt",
    },
    -- Example of a keybinding to open Claude directly
    {
      "<leader>ac",
      function() require("sidekick.cli").toggle({ name = "claude", focus = true }) end,
      desc = "Sidekick Toggle Claude",
    },
  },
}
