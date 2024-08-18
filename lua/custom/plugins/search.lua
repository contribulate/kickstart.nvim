-- search
return {
  'junegunn/vim-slash',
  config = function()
    if vim.fn.has 'timers' == 1 then
      vim.keymap.set('', '<Plug>(slash-after)', function()
        return 'zz' .. vim.fn['slash#blink'](2, 50)
      end, { expr = true, noremap = true, silent = true })
    else
      vim.keymap.set('', '<Plug>(slash-after)', 'zz', { noremap = true, silent = true })
    end
  end,
}
