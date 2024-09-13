-- insert-email-addresses
return {
  'ibhagwan/fzf-lua',
  keys = {
    {
      '<leader>v',
      function()
        require('fzf-lua').fzf_exec('notmuch-abook export -f email -s name', {
          actions = {
            default = function(selected)
              vim.cmd('normal! A' .. table.concat(selected, ', '))
            end,
          },
          keymap = {
            fzf = {
              tab = 'toggle+clear-query',
            },
          },
          fzf_opts = {
            ['--multi'] = '',
          },
        })
      end,
      noremap = true,
      silent = true,
    },
  },
}
