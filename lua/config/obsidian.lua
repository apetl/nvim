-- Function to update the "dateModified" field in YAML front matter
local function update_date_modified()
  local line1 = vim.fn.getline(1)

  -- Check if the file has YAML front matter (starts with "---")
  if line1 == "---" then
    local date_modified_line_index = nil
    local date_modified = os.date("%d-%m-%Y") -- Format: DD-MM-YYYY

    -- Find the "dateModified" field in the YAML front matter
    for i = 2, vim.fn.line("$") do
      local line = vim.fn.getline(i)
      if line:match("^dateModified:") then
        date_modified_line_index = i
        break
      elseif line == "---" then
        break -- End of YAML front matter
      end
    end

    -- Only update the "dateModified" field if it exists
    if date_modified_line_index then
      vim.fn.setline(date_modified_line_index, "dateModified: " .. date_modified)
    end
  end
end

-- Autocommand to trigger the function on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.md", -- Apply only to Markdown files
  callback = update_date_modified,
})
