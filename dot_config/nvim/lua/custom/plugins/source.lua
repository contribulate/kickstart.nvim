return {
  'nvim-lua/plenary.nvim', -- TODO Do not rely on a dummy dependency.
  -- Key mapping for reloading the Neovim configuration
  keys = {
    {
      '<leader>V',
      function()
        vim.cmd('luafile ' .. vim.env.MYVIMRC)
      end,
      mode = 'n',
      noremap = true,
      silent = true,
    },
  },
}
