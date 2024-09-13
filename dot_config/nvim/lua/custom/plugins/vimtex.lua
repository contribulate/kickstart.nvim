-- vimtex
return {
  -- A modern vim plugin for editing LaTeX files
  'lervag/vimtex',
  lazy = true,
  ft = { 'tex', 'latex' },
  init = function()
    -- vimtex synctex
    vim.g.vimtex_view_method = 'mupdf'
    -- disable spell checking in tex comments
    vim.g.vimtex_syntax_nospell_comments = 1
  end,
}
