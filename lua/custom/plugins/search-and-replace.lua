-- search and replace
return {
  -- easily search for, substitute, and abbreviate multiple variants of a word
  'tpope/vim-abolish',
  config = function()
    -- Replace selection with search pattern using // in visual mode
    vim.keymap.set('v', '//', '"hy/<C-r>=escape(@",\'/\\^$.*[~\')<CR>', { noremap = true, silent = true })

    -- Whole file: Replace selection with the standard search and replace tool
    vim.keymap.set('v', '<C-r>', '"hy:%s/<C-r>=escape(@",\'/\\^$.*[~\')<CR>//Ig<left><left><left>', { noremap = true, silent = true })

    -- Line range: Replace selection with the standard search and replace tool
    vim.keymap.set('v', '<S-r>', '"hy:.s/<C-r>=escape(@",\'/\\^$.*[~\')<CR>//Ig<left><left><left>', { noremap = true, silent = true })

    -- Whole file: Replace selection using Subvert (preserves case and handles plural/singular)
    vim.keymap.set('v', '<C-s>', '"hy:%Subvert/<C-r>=escape(@",\'/\\^$.*[~\')<CR>//g<left><left>', { noremap = true, silent = true })

    -- Line range: Replace selection using Subvert (preserves case and handles plural/singular)
    vim.keymap.set('v', '<S-f>', '"hy:.Subvert/<C-r>=escape(@",\'/\\^$.*[~\')<CR>//g<left><left>', { noremap = true, silent = true })

    -- Current line: Add a newline after each occurrence of the last search term
    vim.keymap.set('n', 'SS', ':s//&\\r/g<CR>', { noremap = true, silent = true })
  end,
}
