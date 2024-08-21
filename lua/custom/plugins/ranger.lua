-- ranger
return {
  {
    -- Ranger integration in vim and neovim
    -- 'francoiscabrol/ranger.vim',
    'kelly-lin/ranger.nvim',
    lazy = true,
    keys = {
      {
        '<leader>r',
        function()
          require('ranger-nvim').open(true)
        end,
        noremap = true,
      },
      {
        '<leader>R',
        function()
          require('ranger-nvim').open(false)
        end,
        noremap = true,
      },
    },
    config = function()
      local ranger_nvim = require 'ranger-nvim'
      ranger_nvim.setup {
        enable_cmds = false,
        replace_netrw = true,
        keybinds = {
          ['ov'] = ranger_nvim.OPEN_MODE.vsplit,
          ['oh'] = ranger_nvim.OPEN_MODE.split,
          ['ot'] = ranger_nvim.OPEN_MODE.tabedit,
          ['or'] = ranger_nvim.OPEN_MODE.rifle,
        },
        ui = {
          border = 'none',
          height = 0.95,
          width = 1,
          x = 0.5,
          y = 0.5,
        },
      }
    end,
  },
}
