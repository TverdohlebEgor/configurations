return {
  "junegunn/vim-easy-align",
  config = function()
    -- Map 'ga' in visual mode to trigger EasyAlign
    vim.keymap.set("x", "ga", "<Plug>(EasyAlign)", { desc = "Easy Align (Visual)" })
    
    -- Map 'ga' in normal mode to trigger EasyAlign (e.g., 'gaip' for a paragraph)
    vim.keymap.set("n", "ga", "<Plug>(EasyAlign)", { desc = "Easy Align (Normal)" })
  end,
}
