return {
  "stevearc/oil.nvim",
  opts = {
    float = {
      enable = true,
      padding = 2,
      max_width = 140,
      max_height = 35,
      border = "rounded",
      win_options = {
        winblend = 0,
      },
    },
    view_options = {
      show_hidden = true,
    },
    preview = {
      border = "rounded",
      win_options = {
        winblend = 0,
      },
    },
    preview_dir = "right",
    keymaps = {
      ["<C-c>"] = "actions.close",
      ["q"] = "actions.close",
      ["p"] = "actions.preview",
    },
    use_default_keymaps = true,
  },
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  lazy = false,
  keys = {
    { "<leader>fo", "<cmd>Oil --float --preview<cr>", desc = "Open Oil file explorer in float" },
  },
  config = function(_, opts)
    require("oil").setup(opts)

    vim.api.nvim_set_hl(0, "OilDir", { link = "Directory" })
    vim.api.nvim_set_hl(0, "OilDirIcon", { link = "Directory" })
    vim.api.nvim_set_hl(0, "OilLink", { link = "Special" })
    vim.api.nvim_set_hl(0, "OilLinkTarget", { link = "Comment" })
    vim.api.nvim_set_hl(0, "OilCopy", { link = "DiagnosticInfo" })
    vim.api.nvim_set_hl(0, "OilMove", { link = "DiagnosticWarn" })
    vim.api.nvim_set_hl(0, "OilChange", { link = "DiagnosticHint" })
    vim.api.nvim_set_hl(0, "OilCreate", { link = "DiagnosticOk" })
    vim.api.nvim_set_hl(0, "OilDelete", { link = "DiagnosticError" })
    vim.api.nvim_set_hl(0, "OilFloatBorder", { link = "FloatBorder" })
    vim.api.nvim_set_hl(0, "OilFloatNormal", { link = "NormalFloat" })
  end,
}
