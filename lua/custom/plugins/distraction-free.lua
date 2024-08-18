-- distraction-free
local function enable_autonumber()
  vim.cmd [[
    augroup rn_autonumber
      autocmd!
      if exists("&relativenumber")
        set relativenumber
        autocmd InsertEnter * :set norelativenumber
        autocmd InsertLeave * :set relativenumber
      endif
    augroup END
  ]]
end

local function disable_autonumber()
  vim.cmd 'au! rn_autonumber'
end

enable_autonumber()

return {
  {
    'junegunn/limelight.vim',
    cmd = 'Limelight',
    init = function()
      -- Configuration options for Limelight
      vim.g.limelight_paragraph_span = 1
      vim.g.limelight_priority = -1
    end,
  },
  {
    'junegunn/goyo.vim',
    cmd = 'Goyo',
    init = function()
      -- Configuration options for Goyo
      vim.g.goyo_width = 90
      -- Keybinding to toggle Goyo
      vim.api.nvim_set_keymap('n', '<Leader>g', ':Goyo<CR>', { noremap = true, silent = true })
    end,
    config = function()
      -- Autocommands for GoyoEnter and GoyoLeave
      local function goyo_enter()
        if vim.fn.has 'gui_running' == 1 then
          vim.o.fullscreen = true
          vim.o.background = 'light'
          vim.o.linespace = 7
        elseif vim.fn.exists '$TMUX' == 1 then
          vim.cmd 'silent !tmux set status off'
        end
        -- Disable autonumber and set options for distraction-free mode
        disable_autonumber()
        vim.o.wrap = false
        vim.cmd 'Limelight'
        vim.o.scrolloff = 999
      end

      local function goyo_leave()
        vim.o.scrolloff = 3
        vim.cmd 'Limelight!'
        if vim.fn.has 'gui_running' == 1 then
          vim.o.fullscreen = false
          vim.o.background = 'dark'
          vim.o.linespace = 0
        elseif vim.fn.exists '$TMUX' == 1 then
          vim.cmd 'silent !tmux set status on'
        end
        vim.o.wrap = true
        enable_autonumber()
      end

      vim.api.nvim_create_autocmd('User', {
        pattern = 'GoyoEnter',
        callback = function()
          goyo_enter()
        end,
        nested = true,
      })

      vim.api.nvim_create_autocmd('User', {
        pattern = 'GoyoLeave',
        callback = function()
          goyo_leave()
        end,
        nested = true,
      })
    end,
  },
}
