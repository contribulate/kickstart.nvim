-- unimpaired

return {
  -- pairs of handy bracket mappings
  --   - {[,]}<space>: add newlines
  --   - {[,]}e: exchange lines
  --   - yos: toggle spellcheck
  --   - {[,]}u: URL encode/decode
  --   - ... https://github.com/tpope/vim-unimpaired/blob/master/doc/unimpaired.txt
  'tpope/vim-unimpaired',
  dependencies = {
    -- enable repeating unimpaired mappings with "."
    'tpope/vim-repeat',
  },
}
