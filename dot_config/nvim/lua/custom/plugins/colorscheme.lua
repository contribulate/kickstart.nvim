-- colorscheme
return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    on_colors = function(colors)
      colors.bg = '#1c1c1c'
      colors.bg_dark = '#0a0a0a'
      colors.bg_float = '#1c1c1c'
      colors.bg_highlight = '#2a2a2a'

      colors.blue = '#81a2be'
      colors.blue0 = '#7d79a1'
      colors.blue1 = '#aac3de'
      colors.blue2 = '#9db9d7'
      colors.blue5 = '#b9ddff'
      colors.blue6 = '#c4f9f8'
      colors.blue7 = '#40405f'
      colors.comment = '#767676'
      colors.cyan = '#9abeb7'
      colors.dark3 = '#545c7e'
      colors.dark5 = '#737aa2'
      colors.fg = '#c5c8c6'
      colors.fg_dark = '#bcbcbc'
      colors.fg_gutter = '#3b4261'
      colors.green = '#9faf5f'
      colors.green1 = '#b5cd68'
      colors.green2 = '#61a685'
      colors.magenta = '#bbaaf7'
      colors.magenta2 = '#ff5f7c'
      colors.orange = '#de937f'
      colors.purple = '#b294bb'
      colors.red = '#cc6666'
      colors.red1 = '#8f4f4f'
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
    --vim.o.termguicolors = false
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
