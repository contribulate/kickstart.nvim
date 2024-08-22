-- spelling

-- Define autocommands for spell checking
vim.api.nvim_create_augroup('spelling', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
  group = 'spelling',
  pattern = { 'tex', 'plaintex', 'mail', 'gitcommit' },
  command = 'setlocal spell',
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = 'spelling',
  pattern = { '*.tex', '*.md', '*.mmark' },
  command = 'setlocal spell',
})

vim.opt.spelllang = { 'en_us' }
-- set spellfile=~/.vim/spell/en.utf-8.add
vim.g.tex_comment_nospell = 1
-- See also
-- https://vi.stackexchange.com/questions/68/autocorrect-spelling-mistakes#15872
-- https://vi.stackexchange.com/questions/68/autocorrect-spelling-mistakes#312
-- https://www.reddit.com/r/vim/comments/4xgof3/improvements_to_awesome_correct_spelling_shortcut
-- https://vi.stackexchange.com/questions/15051/how-can-i-use-multiple-spell-files-at-the-same-time

-- Add spelling dictionary suggestions to native complete menu when available.
vim.opt.complete:append 'kspell'

return {}
