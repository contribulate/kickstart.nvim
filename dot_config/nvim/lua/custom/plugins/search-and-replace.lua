-- search and replace
return {
  -- easily search for, substitute, and abbreviate multiple variants of a word
  'tpope/vim-abolish',
  lazy = true,
  cmd = {
    'Subvert',
  },
  keys = {
    -- Replace selection with search pattern using // in visual mode
    { '//', '"hy/<C-r>=escape(@",\'/\\^$.*[~\')<CR>', mode = 'v', noremap = true, silent = true },

    -- Whole file: Replace selection with the standard search and replace tool
    { '<C-r>', '"hy:%s/<C-r>=escape(@",\'/\\^$.*[~\')<CR>//Ig<left><left><left>', mode = 'v', noremap = true, silent = true },

    -- Line range: Replace selection with the standard search and replace tool
    { '<S-r>', '"hy:.s/<C-r>=escape(@",\'/\\^$.*[~\')<CR>//Ig<left><left><left>', mode = 'v', noremap = true, silent = true },

    -- Whole file: Replace selection using Subvert (preserves case and handles plural/singular)
    { '<C-s>', '"hy:%Subvert/<C-r>=escape(@",\'/\\^$.*[~\')<CR>//g<left><left>', mode = 'v', noremap = true, silent = true },

    -- Line range: Replace selection using Subvert (preserves case and handles plural/singular)
    { '<S-f>', '"hy:.Subvert/<C-r>=escape(@",\'/\\^$.*[~\')<CR>//g<left><left>', mode = 'v', noremap = true, silent = true },

    -- Current line: Add a newline after each occurrence of the last search term
    { 'SS', ':s//&\\r/g<CR>', mode = 'n', noremap = true, silent = true },
  },
}
