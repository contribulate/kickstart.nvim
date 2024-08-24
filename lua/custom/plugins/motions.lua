-- motions
return {
  -- search and jump to a single character with <leader><leader>s<char>
  'easymotion/vim-easymotion',
  keys = {
    -- Replace search with easymotion multi char search
    { '/', '<Plug>(easymotion-sn)', mode = 'n' },
    { '/', '<Plug>(easymotion-tn)', mode = 'o' },

    -- These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
    -- Without these mappings, `n` & `N` works fine. (These mappings just provide
    -- different highlight method and have some other features )
    { 'n', '<Plug>(easymotion-next)', mode = 'n' },
    { 'N', '<Plug>(easymotion-prev)', mode = 'n' },
  },
}
