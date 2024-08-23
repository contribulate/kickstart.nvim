-- surround
return {
  -- quoting/parenthesizing made simple
  --   - cs"': replace "..." by '...' (works with <html>: cs'<q>, cst")
  --   - ds": replace "..." by ...
  --   - ysiw]: replaces <cword> by [<cword>]
  --   - ysiW[: replaces <cWord> by [ <cWord> ]
  --   - yss_: replace line by _line_
  --   - In visual mode `S_`
  'tpope/vim-surround',
  config = function()
    -- vimtex + surround = magic
    vim.api.nvim_create_augroup('latexSurround', { clear = true })

    local latexSurround = function()
      -- Dynamically set buffer-local variables for each surround mapping
      vim.b[string.format('surround_%d', string.byte 'e')] = '\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}'
      vim.b[string.format('surround_%d', string.byte 'c')] = '\\\1command: \1{\r}'
      vim.b[string.format('surround_%d', string.byte 'q')] = "`\r'"
      vim.b[string.format('surround_%d', string.byte 'Q')] = "``\r''"
      vim.b[string.format('surround_%d', string.byte 'O')] = 'O(\r)'
    end

    vim.api.nvim_create_autocmd('FileType', {
      group = 'latexSurround',
      pattern = { 'tex', 'plaintex' },
      callback = latexSurround,
    })
  end,
}
