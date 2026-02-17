return {
  "iamcco/markdown-preview.nvim",
  lazy = true,
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function()
    require("lazy").load { plugins = { "markdown-preview.nvim" } }
    vim.fn["mkdp#util#install"]()
  end,
}
