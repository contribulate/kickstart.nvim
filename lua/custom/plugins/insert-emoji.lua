-- insert-emoji
return {
  'ibhagwan/fzf-lua',
  keys = {
    {
      '<leader>i',
      function()
        require('fzf-lua').fzf_exec('emojify --list | grep "^:"', {
          actions = {
            default = function(selected)
              vim.cmd('normal! i' .. table.concat(selected, ', '))
            end,
          },
        })
      end,
      noremap = true,
      silent = true,
    },
  },
}
