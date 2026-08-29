# Neovim Configuration

A personal Neovim setup based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim),
managed with [lazy.nvim](https://github.com/folke/lazy.nvim). The leader key is `<Space>`.

Plugins live in `lua/custom/plugins/`, with a few declared directly in `init.lua`.

## Plugins

### Core & LSP

| Plugin | Repo | Description |
|---|---|---|
| nvim-lspconfig | neovim/nvim-lspconfig | Core LSP setup with Mason (mason.nvim, mason-lspconfig, mason-tool-installer), fidget and cmp-nvim-lsp; configures gopls, pyright, ruff, jdtls, lua_ls, html, buf_ls, expert and Python venv resolution. |
| nvim-cmp | hrsh7th/nvim-cmp | Autocompletion engine wired to LSP, LuaSnip snippets, path and lazydev sources. |
| conform.nvim | stevearc/conform.nvim | Autoformatting on save with per-filetype formatters (stylua, google-java-format, goimports/gofumpt) and LSP fallback. |
| nvim-lint | mfussenegger/nvim-lint | Asynchronous linting on buffer events, configured for Elixir (credo) and Go (golangci-lint). |
| nvim-treesitter | nvim-treesitter/nvim-treesitter | Treesitter parsing for highlighting/navigation, auto-installing a broad parser set. |
| nvim-treesitter-context | nvim-treesitter/nvim-treesitter-context | Shows the enclosing function/class as a sticky window at the top of the buffer. |
| nvim-ufo | kevinhwang91/nvim-ufo | Modern, LSP/Treesitter-backed code folding. |
| lazydev.nvim | folke/lazydev.nvim | Configures the Lua LSP for Neovim config development, loading luvit-meta types when `vim.uv` is used. |
| luvit-meta | Bilal2453/luvit-meta | Type/meta definitions for the luv (`vim.uv`) library, consumed by lazydev. |

### Language-specific

| Plugin | Repo | Description |
|---|---|---|
| nvim-jdtls | mfussenegger/nvim-jdtls | Advanced Java LSP (jdtls) integration with Lombok agent, extract refactors, and DAP/test hooks. |
| flutter-tools.nvim | akinsho/flutter-tools.nvim | Flutter/Dart tooling (dartls, hot reload/restart, logs, profiler) with dart-filetype keymaps. |
| markdown-preview.nvim | iamcco/markdown-preview.nvim | Live browser preview of markdown files. |
| render-markdown.nvim | MeanderingProgrammer/render-markdown.nvim | In-buffer rendering/prettifying of markdown. |

### UI & appearance

| Plugin | Repo | Description |
|---|---|---|
| kanagawa.nvim | rebelot/kanagawa.nvim | Colorscheme; loads the **kanagawa-dragon** variant with custom diff highlight tweaks. |
| lualine.nvim | mathieurousseau/lualine.nvim (fork) | Statusline themed `kanagawa-dragon`, with sidekick/Copilot CLI status indicators. |
| bufferline.nvim | akinsho/bufferline.nvim | Buffer tabline with LSP diagnostics, slope separators, and pin/close keymaps. |
| noice.nvim | folke/noice.nvim | Modern UI for the cmdline, messages and popupmenu. |
| nvim-notify | rcarriga/nvim-notify | Animated notification popups. |
| snacks.nvim | folke/snacks.nvim | QoL suite: dashboard, picker/explorer, notifier, scroll animation, terminal, scratch and git/LSP pickers. |
| indent-blankline.nvim | lukas-reineke/indent-blankline.nvim | Indentation guide lines with rainbow-colored scope highlighting. |
| rainbow-delimiters.nvim | HiPhish/rainbow-delimiters.nvim | Colors matching brackets/delimiters by nesting depth. |
| statuscol.nvim | luukvbaal/statuscol.nvim | Configurable status/number/fold column with clickable segments. |
| modicator.nvim | mathieurousseau/modicator.nvim (fork) | Colors the cursor-line number to reflect the current Vim mode. |
| vim-illuminate | RRethy/vim-illuminate | Highlights other occurrences of the word under the cursor. |
| no-neck-pain.nvim | shortcuts/no-neck-pain.nvim | Centers the buffer with padding side windows, plus a persistent markdown scratchpad. |
| aerial.nvim | stevearc/aerial.nvim | Code outline/symbol navigation window with `{`/`}` jumps. |

### Git

| Plugin | Repo | Description |
|---|---|---|
| gitsigns.nvim | lewis6991/gitsigns.nvim | Git change signs in the gutter plus hunk staging/reset/preview/blame keymaps. |
| mini.diff | echasnovski/mini.diff | Git diff visualization with sign-style hunks and an overlay toggle. |
| lazygit.nvim | kdheepak/lazygit.nvim | Opens the LazyGit TUI in a floating window via `<leader>lg`. |
| vim-fugitive | tpope/vim-fugitive | Comprehensive Git command wrapper inside Vim. |
| vim-rhubarb | tpope/vim-rhubarb | GitHub extension for fugitive (`:GBrowse`, GitHub URL/omni-completion). |
| diffview.nvim | sindrets/diffview.nvim | Tabbed side-by-side Git diff and merge-conflict/file-history review. |

### Editing & navigation

| Plugin | Repo | Description |
|---|---|---|
| mini.nvim | echasnovski/mini.nvim | Small modules; here mini.ai (text objects) and mini.surround (add/delete/replace surroundings). |
| vim-visual-multi | mg979/vim-visual-multi | Multiple-cursors editing (Sublime-style simultaneous selections). |
| vim-abolish | tpope/vim-abolish | Smart word substitution, case coercion (snake/camel/etc.), and abbreviations. |
| oil.nvim | stevearc/oil.nvim | Edit the filesystem like a buffer, opened via `-`. |
| arena.nvim | dzfrias/arena.nvim | Frecency-based buffer switcher toggled with `<leader>bb`. |
| marks.nvim | chentoast/marks.nvim | Improved viewing and management of Vim marks in the sign column. |
| trouble.nvim | folke/trouble.nvim | Filterable list panel for diagnostics, LSP references/symbols, quickfix and loclist. |
| todo-comments.nvim | folke/todo-comments.nvim | Highlights and lists TODO/NOTE/FIX-style comment keywords. |
| which-key.nvim | folke/which-key.nvim | Popup showing pending keybindings and documenting leader-key groups. |
| hardtime.nvim | m4xshen/hardtime.nvim | Enforces good movement habits by limiting repeated key presses. |
| FTerm.nvim | numToStr/FTerm.nvim | Floating terminal toggled with `Alt-i`. |
| auto-session | rmagatti/auto-session | Automatic saving/restoring of editing sessions per directory. |

### AI assistance

| Plugin | Repo | Description |
|---|---|---|
| sidekick.nvim | folke/sidekick.nvim | AI coding companion integrating CLI assistants (Claude, Codex) via tmux, with LSP "next edit suggestions". |
| copilot.vim | github/copilot.vim | Official GitHub Copilot inline code completion. |
