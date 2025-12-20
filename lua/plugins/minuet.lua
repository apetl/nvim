return {
  "milanglacier/minuet-ai.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("minuet").setup({
      provider = "openai_compatible",
      -- ollama
      -- openai_compatible = {
      -- model = "deepseek-coder:6.7b", -- change to your preferred Ollama model
      -- end_point = "http://localhost:11434/v1/chat/completions",
      -- api_key = "dummy", -- Ollama doesn't need a real key
      -- name = "Ollama",
      -- stream = true,
      -- },
      -- openrouter
      openai_compatible = {
        model = "mistralai/codestral-2508@preset/dev",
        end_point = "https://openrouter.ai/api/v1/chat/completions",
        api_key = os.getenv("OPENROUTER_API_KEY"),
        name = "",
        stream = true,
      },
      -- Debounce time in milliseconds
      debounce = 500,
      -- Number of lines of context to use
      context_window = 64,
    })
  end,

  blink = {
    enabled = false,
    trigger_in_insert = false,
  },
  request_timeout = 0.3,
  keys = {
    {
      "<localleader>c",
      function()
        vim.cmd("Minuet blink toggle")
      end,
      desc = "Toggle AI Code Completion",
      mode = { "n", "i" },
    },
  },
}
