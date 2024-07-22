-- plugins.lua
return {
  -- Other plugins
  {
    "lvimuser/lsp-inlayhints.nvim",
    config = function()
      require("lsp-inlayhints").setup({
        inlay_hints = {
          parameter_hints = {
            show = true,
            prefix = "<- ",
            separator = ", ",
          },
          type_hints = {
            show = true,
            prefix = "",
            separator = ", ",
          },
          only_current_line = false,
          labels_separator = " ",
          max_len_align = false,
          max_len_align_padding = 1,
          highlight = "LspInlayHint",
          priority = 0,
        },
        enabled_at_startup = true,
        debug_mode = false,
      })
    end,
    event = "LspAttach",
  },
}
