-- colorscheme
return { -- You can easily change to a different colorscheme.
  -- Change the name of the colorscheme plugin below, and then
  -- change the command in the config to whatever the name of that cniolorscheme is.
  --
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  'make-github-pseudonymous-again/vim-colorschemes',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  init = function()
    -- Set terminal colors and background
    vim.o.termguicolors = false
    vim.o.background = 'dark'

    -- Enable syntax highlighting
    vim.cmd.syntax 'on'
    -- Use Hybrid, to use ~/.Xresources uncomment next line
    -- vim.g.hybrid_use_Xresources = 1

    vim.cmd.colorscheme 'hybrid'
    -- vim.cmd.colorscheme seoul256

    -- Avoid vimdiff color clashes
    -- See https://stackoverflow.com/a/49061325/1582182
    if vim.o.diff then
      vim.cmd.syntax 'off'
    end
  end,
}
