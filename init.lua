-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.guicursor = { "sm:block,n-v-c:ver25,i-ci-ve:ver25-blinkwait100-blinkon100-blinkoff100,r-cr-o:hor20" }
vim.cmd([[highlight CursorLine ctermbg=NONE guibg=NONE]])

vim.o.shell = "pwsh.exe"

if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 1,
  }
end

require("scrollEOF").setup()

-- Override the cmp.entry.get_documentation setting
-- require("cmp").setup({
--   lsp = {
--     override = {
--       ["cmp.entry.get_documentation"] = {
--         enabled = false,
--       },
--     },
--   },
-- })

-- Custom highlights for documentation
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e1e2e", fg = "#cdd6f4" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#1e1e2e", fg = "#cdd6f4" })
vim.api.nvim_set_hl(0, "CmpDocumentation", { bg = "#1e1e2e", fg = "#cdd6f4" })
vim.api.nvim_set_hl(0, "CmpDocumentationBorder", { bg = "#1e1e2e", fg = "#cdd6f4" })

--vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
--vim.api.nvim_create_autocmd("LspAttach", {
--  group = "LspAttach_inlayhints",
--  callback = function(args)
--    if not (args.data and args.data.client_id) then
--      return
--    end
--    local bufnr = args.buf
--    local client = vim.lsp.get_client_by_id(args.data.client_id)
--    require("lsp-inlayhints").on_attach(client, bufnr)
--  end,
--})
