return {
  "saghen/blink.cmp",
  dependencies = {
    "Kaiser-Yang/blink-cmp-avante",
    "milanglacier/minuet-ai.nvim",
  },
  opts = function()
    return {
      enabled = function()
        return vim.bo.filetype ~= "markdown"
      end,

      keymap = {
        preset = "default",
        ["<C-space>"] = {
          function(cmp)
            cmp.show({ providers = { "minuet" } })
          end,
        },
      },

      completion = {
        ghost_text = { enabled = false },
      },

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        providers = {
          -- avante = {
          --   module = "blink-cmp-avante",
          --   name = "Avante",
          --   opts = {},
          -- },
          minuet = {
            name = "minuet",
            module = "minuet.blink",
            async = true,
            timeout_ms = 3000,
            score_offset = 100, -- Boost score so it stays at top when manually triggered
          },
          snippets = {
            name = "snippets",
          },
        },
      },
    }
  end,
}
