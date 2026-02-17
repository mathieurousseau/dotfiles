return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      local ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', 'elixir', 'eex', 'heex', 'java', 'groovy', 'css', 'javascript', 'latex', 'norg', 'scss', 'svelte', 'tsx', 'typst', 'vue', 'regex' }

      require('nvim-treesitter').setup({
        ensure_installed = ensure_installed,
        auto_install = true,
      })

      -- Check for missing parsers on startup and install them
      vim.defer_fn(function()
        local missing = {}
        for _, lang in ipairs(ensure_installed) do
          local ok = pcall(vim.treesitter.language.inspect, lang)
          if not ok then
            table.insert(missing, lang)
          end
        end
        if #missing > 0 then
          vim.notify('Installing missing treesitter parsers: ' .. table.concat(missing, ', '), vim.log.levels.INFO)
          vim.cmd('TSInstall ' .. table.concat(missing, ' '))
        end
      end, 100)

      -- Enable treesitter highlighting for all buffers with a parser
      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          local ok = pcall(vim.treesitter.start, args.buf)
          if not ok then
            pcall(vim.treesitter.stop, args.buf)
          end
        end,
      })
    end,
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  }
}
