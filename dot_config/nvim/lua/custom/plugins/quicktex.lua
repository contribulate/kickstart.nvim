-- quicktex
return {
  -- A vim plugin for writing Latex quickly
  'brennier/quicktex',
  lazy = true,
  event = 'InsertEnter *.tex',
  config = function()
    vim.api.nvim_exec_autocmds('FileType', { pattern = '<buffer>' })
  end,
}
