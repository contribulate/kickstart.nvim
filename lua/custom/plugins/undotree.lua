-- undotree
return {
  'mbbill/undotree',
  lazy = true,
  cmd = 'UndotreeToggle',
  keys = {
    { 'U', '<cmd>UndotreeToggle<cr>', desc = 'Toggle [U]ndotree' },
  },
  config = function()
    vim.g.undotree_WindowLayout = 2
  end,
}
