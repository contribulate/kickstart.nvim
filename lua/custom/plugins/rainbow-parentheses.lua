return {
  -- Rainbow parentheses!
  'junegunn/rainbow_parentheses.vim',
  cmd = {
    'RainbowParentheses',
    'RainbowParenthesesColors',
  },
  init = function()
    -- configure rainbow parentheses
    vim.g['rainbow#max_level'] = 16
    vim.g['rainbow#pairs'] = { { '(', ')' }, { '[', ']' }, { '{', '}' } }
  end,
}
