-- easy-align

return {
  -- A Vim alignment plugin (vipga=, gaip=)
  'junegunn/vim-easy-align',
  keys = {
    -- Start interactive EasyAlign in visual mode (e.g. vipga)
    { 'ga', '<Plug>(EasyAlign)', mode = 'x' },
    -- Start interactive EasyAlign for a motion/text object (e.g. gaip)
    { 'ga', '<Plug>(EasyAlign)', mode = 'n' },
  },
  cmd = 'EasyAlign',
}
