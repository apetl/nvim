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
