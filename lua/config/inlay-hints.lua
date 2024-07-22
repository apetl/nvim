-- ~/.config/nvim/lua/toggle_inlay_hints.lua

local M = {}

M.toggle_inlay_hints = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients({ bufnr = bufnr })
  for _, client in ipairs(clients) do
    if client.server_capabilities.inlayHintProvider then
      local inlay_hints_enabled = vim.lsp.inlay_hint(bufnr, nil)
      vim.lsp.inlay_hint(bufnr, not inlay_hints_enabled)
    end
  end
end

return M
