return {
  "saghen/blink.cmp",
  dependencies = {
    "Kaiser-Yang/blink-cmp-avante",
  },
  opts = {
    completion = {
      ghost_text = {
        enabled = false,
      },
    },
    keymap = {
      ["<Up>"] = {},
      ["<Down>"] = {},
      ["<C-CR>"] = { "select_and_accept" },
      ["<CR>"] = {},
      ["<S-space>"] = { "select_and_accept" },
      ["<Tab>"] = {
        function(cmp)
          if cmp.snippet_active() then
            return cmp.accept()
          else
            return cmp.select_and_accept()
          end
        end,
        "snippet_forward",
        "fallback",
      },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },
    },
    sources = {
      default = { "avante", "lsp", "path", "snippets", "buffer" },
      providers = {
        avante = {
          module = "blink-cmp-avante",
          name = "Avante",
          opts = {},
        },
        snippets = {
          name = "snippets",
        },
      },
    },
  },
}
