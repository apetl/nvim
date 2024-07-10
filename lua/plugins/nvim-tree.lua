return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    cmd = "NvimTreeToggle",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        git = {
          enable = false,
        },
        view = {
          width = 27,
        },
        filesystem_watchers = {
          enable = true,
          debounce_delay = 50,
        },
        actions = {
          open_file = {
            window_picker = {
              enable = false,
            },
          },
        },
        diagnostics = {
          enable = false,
        },
      })
    end,
  },
}
