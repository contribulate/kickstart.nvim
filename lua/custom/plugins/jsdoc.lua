-- jsdoc
return {
  -- Generate JSDoc to your JavaScript code
  'heavenshell/vim-jsdoc',
  ft = { 'javascript', 'javascripreact', 'typescript', 'typescriptreact' },
  build = 'make install',
  keys = {
    -- call jsdoc
    --nmap <silent> <leader>J <Plug>(jsdoc)
    { '<leader>J', '<Plug>(jsdoc)', mode = 'n', silent = true },

    -- search for last function def and call jsdoc
    --nmap <silent> <leader>j ?\(function \\|function\* \\|=>\\|class \)<cr>:noh<cr><Plug>(jsdoc)
    { '<leader>j', [[:?\(function \|function*\|=>\|class \)<CR>:noh<CR><Plug>(jsdoc)]], mode = 'n', silent = true },
  },
  init = function()
    -- Enable jsdoc highlighting in pangloss/vim-javascript
    vim.g.javascript_plugin_jsdoc = 1
  end,
}
