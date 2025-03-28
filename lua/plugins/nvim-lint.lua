return {
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      -- Disable linting for Markdown files
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.markdown = nil
    end,
  },
}
