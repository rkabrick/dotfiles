-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
-- Disable autoformat for lua files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "cpp" },
  callback = function()
    vim.b.autoformat = false
  end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

local function get_git_root(current_file_path)
  -- Change directory temporarily to the folder where current file is
  local cmd = "cd " .. vim.fn.fnamemodify(current_file_path, ":h") .. " && git rev-parse --show-toplevel 2> /dev/null"
  local git_root = vim.fn.systemlist(cmd)[1]
  return git_root
end

---- TODO: Verify LazyVim doesn't already do this
--vim.api.nvim_create_autocmd({ "BufEnter" }, {
--  callback = function()
--    local current_file_path = vim.api.nvim_buf_get_name(0)
--    local proj_root = get_git_root(current_file_path)
--    -- Get the current directory
--    local current_dir = vim.fn.getcwd()
--    -- If we are already in the project root, do nothing
--    if current_dir ~= proj_root then
--      if proj_root ~= "" then
--        vim.loop.chdir(proj_root)
--        require("notify")("Changed directory to " .. proj_root, "info", { title = "BrickCmds" })
--      else
--        vim.loop.chdir("./")
--        require("notify")(
--          "Did not change directory because not git repo found" .. vim.loop.chdir,
--          "info",
--          { title = "BrickCmds" }
--        )
--      end
--    end
--  end,
--})
