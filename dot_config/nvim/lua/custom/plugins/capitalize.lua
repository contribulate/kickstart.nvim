-- capitalize

-- Capitalize words and regions easily
-- from http://vim.wikia.com/wiki/Capitalize_words_and_regions_easily

--<leader>Cw        - capitalize word (from cursor position to end of word)
--<leader>CW        - capitalize WORD (from cursor position to end of WORD)
--<leader>Ciw       - capitalize inner word (from start to end)
--<leader>CiW       - capitalize inner WORD (from start to end)
--<leader>Cis       - capitalize inner sentence
--<leader>C$        - capitalize until end of line (from cursor postition)
--<leader>Cgc       - capitalize whole line (from start to end)
--<leader>Cc        - capitalize whole line
--{Visual}<leader>C - capitalize highlighted text

if vim.opt.tildeop:get() then
  return {
    'nvim-lua/plenary.nvim', -- TODO Do not rely on a dummy dependency.
    lazy = true,
    keys = {
      { '<leader>Cw', 'guw~l', mode = 'n', noremap = true },
      { '<leader>CW', 'guW~l', mode = 'n', noremap = true },
      { '<leader>Ciw', 'guiw~l', mode = 'n', noremap = true },
      { '<leader>CiW', 'guiW~l', mode = 'n', noremap = true },
      { '<leader>Cis', 'guis~l', mode = 'n', noremap = true },
      { '<leader>C$', 'gu$~l', mode = 'n', noremap = true },
      { '<leader>CC', 'guu~l', mode = 'n', noremap = true },
      { '<leader>Cc', 'guu~l', mode = 'n', noremap = true },
      { '<leader>C', 'gu~l', mode = 'v', noremap = true },
    },
  }
else
  return {
    'nvim-lua/plenary.nvim', -- TODO Do not rely on a dummy dependency.
    lazy = true,
    keys = {
      { '<leader>Cw', 'guw~h', mode = 'n', noremap = true },
      { '<leader>CW', 'guW~h', mode = 'n', noremap = true },
      { '<leader>Ciw', 'guiw~h', mode = 'n', noremap = true },
      { '<leader>CiW', 'guiW~h', mode = 'n', noremap = true },
      { '<leader>Cis', 'guis~h', mode = 'n', noremap = true },
      { '<leader>C$', 'gu$~h', mode = 'n', noremap = true },
      { '<leader>CC', 'guu~h', mode = 'n', noremap = true },
      { '<leader>Cc', 'guu~h', mode = 'n', noremap = true },
      { '<leader>C', 'gu~h', mode = 'v', noremap = true },
    },
  }
end
