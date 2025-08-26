local obsidian_ram = vim.fn.has("wsl") == 1 and "/mnt/c/Users/petli/Obsidian/RAM" or "C:\\Users\\petli\\Obsidian\\RAM"

return {
  "folke/snacks.nvim",
  keys = {
    {
      "<leader>fO",
      function()
        require("snacks.picker").files({ cwd = obsidian_ram })
      end,
      desc = "Find file in Obsidian RAM",
    },
  },
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
            "**/.obsidian/**",
            "**/.smart-connections/**",
            "**/.smart-env/**",
            "**/.trash/**",
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
