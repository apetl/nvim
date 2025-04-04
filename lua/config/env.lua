local function load_env()
  local config_path = vim.fn.stdpath("config")
  local env_file = config_path .. "/.env"

  local is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1

  if is_windows and not config_path:match("\\$") then
    env_file = config_path .. "\\.env"
  end

  if vim.fn.filereadable(env_file) == 1 then
    for line in io.lines(env_file) do
      -- Skip comments and empty lines
      if not line:match("^%s*#") and line:match("%S") then
        local name, value = line:match("^%s*(%S+)%s*=%s*(.+)%s*$")
        if name and value then
          -- Remove quotes if present
          value = value:gsub("^[\"'](.+)[\"']$", "%1")
          -- Set environment variable
          vim.fn.setenv(name, value)
        end
      end
    end
    vim.notify("Environment variables loaded from .env file", vim.log.levels.INFO)
  else
    vim.notify("No .env file found at: " .. env_file, vim.log.levels.WARN)
  end
end

load_env()
