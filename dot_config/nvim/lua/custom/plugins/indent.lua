return {
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  init = function()
    vim.opt.tabstop = 4
  end,
}
