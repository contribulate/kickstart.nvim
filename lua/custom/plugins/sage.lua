-- Enable file type detection
vim.cmd [[
  augroup filetypes
    au!
    " Treat .sage files as .py
    autocmd BufNewFile,BufRead *.sage setlocal filetype=python syntax=python softtabstop=4 shiftwidth=4 expandtab
  augroup END
]]

return {}
