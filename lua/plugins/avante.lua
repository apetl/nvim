return {
  "yetone/avante.nvim",
  lazy = true,
  event = "VeryLazy",
  version = false,
  opts = {
    provider = "mistral",
    providers = {
      gemini = {
        __inherited_from = "gemini",
        model = "gemini-2.5-flash",
        timeout = 30000,
        extra_request_body = {
          max_tokens = 16384,
        },
      },
      openai = {
        model = "gpt-4.1-nano",
      },
      groq = {
        __inherited_from = "openai",
        api_key_name = "GROQ_API_KEY",
        endpoint = "https://api.groq.com/openai/v1/",
        extra_request_body = {
          max_tokens = 8192,
          max_completion_tokens = 1024,
        },
        model = "meta-llama/llama-4-maverick-17b-128e-instruct",
      },
      mistral = {
        __inherited_from = "openai",
        api_key_name = "MISTRAL_API_KEY",
        endpoint = "https://api.mistral.ai/v1/",
        model = "devstral-small-2507",
        extra_request_body = {
          max_tokens = 16384,
        },
      },
    },
    web_search_engine = {
      provider = "brave",
    },
    system_prompt = function()
      local hub = require("mcphub").get_hub_instance()
      return hub and hub:get_active_servers_prompt() or ""
    end,
    custom_tools = function()
      return {
        require("mcphub.extensions.avante").mcp_tool(),
      }
    end,
  },
  build = (function()
    if jit.os == "Windows" then
      return "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    else
      return "make"
    end
  end)(),
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          use_absolute_path = true,
        },
      },
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
