return {
  -- add gruvbox
  {
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").setup({
        style = "cool",
      })
    end,
  },
}

--   -- Configure LazyVim to load gruvbox
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "onedark",
--     },
--   },
-- }
