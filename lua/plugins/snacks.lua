return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      hidden = true,
      ignored = true,
      sources = {
        files = {
          hidden = true,
          ignored = true,
          exclude = {
            "**/.git/*",
          },
        },
      },
    },
    zen = {
      toggles = {
        dim = false,
      },
      show = { statusline = true, tabline = true },
      win = {
        width = 100,
      },
    },
  },
}
