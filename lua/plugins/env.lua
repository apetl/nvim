return {
  "ellisonleao/dotenv.nvim",
  config = function()
    require("dotenv").setup({
      enable_on_load = false,
      verbose = true,
      file_name = ".env",
    })
  end,
}
