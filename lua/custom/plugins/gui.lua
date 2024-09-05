-- gui
return {
  'nvim-lua/plenary.nvim', -- TODO Do not rely on a dummy dependency.
  event = 'UIEnter',
  config = function()
    -- clean up the GUI
    if vim.fn.has 'gui_running' == 1 then
      vim.opt.guioptions:remove 'm' -- remove menu bar
      vim.opt.guioptions:remove 'T' -- remove toolbar
      vim.opt.guioptions:remove 'r' -- remove right-hand scroll bar
      vim.opt.guioptions:remove 'L' -- remove left-hand scroll bar

      vim.opt.lines = 60
      vim.opt.columns = 108
      vim.opt.linespace = 0
      vim.opt.guifont = 'LiterationMono Nerd Font Mono:h12'
    end
  end,
}
