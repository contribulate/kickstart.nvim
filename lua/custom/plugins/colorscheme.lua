-- colorscheme
return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    on_colors = function(colors)
      colors.bg = '#1c1c1c'
      colors.bg_dark = '#0a0a0a'
      colors.bg_highlight = '#2a2a2a'
      colors.blue = '#81a2be'
      colors.blue0 = '#3d59a1'
      colors.blue1 = '#5ac3de'
      colors.blue2 = '#0db9d7'
      colors.blue5 = '#89ddff'
      colors.blue6 = '#b4f9f8'
      colors.blue7 = '#00005f'
      colors.comment = '#767676'
      colors.cyan = '#8abeb7'
      colors.dark3 = '#545c7e'
      colors.dark5 = '#737aa2'
      colors.fg = '#c5c8c6'
      colors.fg_dark = '#bcbcbc'
      colors.fg_gutter = '#3b4261'
      colors.green = '#afaf5f'
      colors.green1 = '#b5bd68'
      colors.green2 = '#41a6b5'
      colors.magenta = '#bb9af7'
      colors.magenta2 = '#ff007c'
      colors.orange = '#de935f'
      colors.purple = '#b294bb'
      colors.red = '#cc6666'
      colors.red1 = '#5f0000'
      colors.teal = '#1abc9c'
      colors.terminal_black = '#303030'
      colors.yellow = '#f0c674'
      colors.git = {
        add = '#dfffaf',
        change = '#dfdfff',
        delete = '#df5f5f',
      }
    end,
  },
  init = function()
    vim.o.termguicolors = false
    vim.o.background = 'dark'

    -- Enable syntax highlighting
    vim.cmd.syntax 'on'

    vim.cmd [[colorscheme tokyonight]]

    -- Avoid vimdiff color clashes
    -- See https://stackoverflow.com/a/49061325/1582182
    if vim.o.diff then
      vim.cmd.syntax 'off'
    end
  end,
}
