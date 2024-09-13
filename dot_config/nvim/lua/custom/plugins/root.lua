return {
  'nvim-lua/plenary.nvim', -- TODO Do not rely on a dummy dependency.
  -- Plugin definition (if needed, otherwise this is just for key mappings)
  keys = {
    -- Save file as root with <leader>W
    { '<leader>W', ':w !sudo tee % > /dev/null<CR>', mode = 'n', noremap = true, silent = true },
  },
}
