return {
  "gbprod/cutlass.nvim",
  opts = {
    cut_key = "_d",
    override_del = true,
    registers = {
      select = "_",
      delete = "_",
      change = "_",
    },
    exclude = {
      "ns-textobject",
    },
  },
  config = function(_, opts)
    require("cutlass").setup(opts)
  end,
}
