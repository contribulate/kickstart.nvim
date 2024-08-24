-- A git commit browser (depends on tpope/vim-fugitive)
return {
  'junegunn/gv.vim',
  dependencies = {
    -- git bindings
    -- fugitive.vim: a Git wrapper so awesome, it should be illegal
    'tpope/vim-fugitive',
  },
}
