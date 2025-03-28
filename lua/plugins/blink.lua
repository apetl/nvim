return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      ghost_text = {
        enabled = false,
      },
    },
    keymap = {
      ["<Up>"] = {},
      ["<Down>"] = {},
      ["<C-y>"] = { "select_and_accept" },
      ["<CR>"] = {},
      ["<S-space>"] = { "select_and_accept" },
    },
  },
}
