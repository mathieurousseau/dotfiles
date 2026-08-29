-- Width stages cycled by <c-g>: default (cli.win.split.width) -> 100% -> 30%.
local STAGE_DEFAULT, STAGE_FULL, STAGE_SMALL = 1, 2, 3
local sidekick_stage = STAGE_DEFAULT

local function sidekick_terminal()
  for _, state in ipairs(require("sidekick.cli.state").get({ attached = true, terminal = true })) do
    if state.terminal then
      return state.terminal
    end
  end
end

local function set_sidekick_width(win, stage)
  if stage == STAGE_FULL then
    vim.api.nvim_win_call(win, function()
      vim.cmd("vertical resize 999")
    end)
  elseif stage == STAGE_SMALL then
    vim.api.nvim_win_set_width(win, math.floor(vim.o.columns * 0.3))
  else
    -- Same fraction-or-columns rule the plugin applies in `open_win`.
    local width = require("sidekick.config").cli.win.split.width
    vim.api.nvim_win_set_width(win, width <= 1 and math.floor(vim.o.columns * width) or width)
  end
end

local function cycle_sidekick_width()
  -- Sample before showing: State.with reopens a hidden pane, so checking
  -- afterwards can no longer tell whether this press was an open or a resize.
  local terminal = sidekick_terminal()
  local was_open = terminal ~= nil and terminal:is_open()

  -- State.with defers to after attach/show, unlike cli.show which returns
  -- before the window exists.
  require("sidekick.cli.state").with(function(state)
    local term = state.terminal
    if not term or not term:is_open() or require("sidekick.config").cli.win.layout == "float" then
      return
    end

    if not was_open then
      sidekick_stage = STAGE_DEFAULT -- just opened at split.width; nothing to resize
      return
    end

    sidekick_stage = sidekick_stage % STAGE_SMALL + 1
    set_sidekick_width(term.win, sidekick_stage)
  end, { attach = true, show = true, focus = true })
end

return {
  "folke/sidekick.nvim",
  init = function()
    local group = vim.api.nvim_create_augroup("custom_sidekick_shift_enter", { clear = true })

    vim.api.nvim_create_autocmd("FileType", {
      group = group,
      pattern = "sidekick_terminal",
      callback = function(args)
        vim.schedule(function()
          if not vim.api.nvim_buf_is_valid(args.buf) then
            return
          end

          local tool = vim.b[args.buf].sidekick_cli
          if type(tool) ~= "table" then
            return
          end

          -- Codex wants a literal newline; Claude (and others) expect the
          -- kitty keyboard protocol encoding for Shift+Enter.
          local seq = tool.name == "codex" and "\n" or "\x1b[13;2u"

          vim.keymap.set("t", "<S-CR>", function()
            local job = vim.b[args.buf].terminal_job_id
            if job then
              vim.api.nvim_chan_send(job, seq)
            end
          end, { buffer = args.buf, desc = "Sidekick newline" })
        end)
      end,
    })
  end,
  opts = {
    -- add any options here
    cli = {
      win = {
        -- <= 1 is treated as a fraction of `vim.o.columns`, so 0.5 == 50%.
        split = { width = 0.5 },
        -- keys = {
        --   nav_down = false,
        -- },
      },
      mux = {
        backend = "tmux",
        enabled = true,
      },
      prompts = {
        -- Claude Code slash command; sidekick inserts without submitting, so
        -- this lands in the input for you to send.
        pr_review = "/responding-to-pr-comments",
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
      cycle_sidekick_width,
      desc = "Sidekick Cycle Width (default/50%/100%)",
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
