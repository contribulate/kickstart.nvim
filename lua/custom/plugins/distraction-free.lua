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
    lazy = true,
    cmd = 'Limelight',
    init = function()
      -- Configuration options for Limelight
      vim.g.limelight_paragraph_span = 1
      vim.g.limelight_priority = -1
    end,
  },
  {
    'junegunn/goyo.vim',
    lazy = true,
    cmd = 'Goyo',
    keys = {
      { '<Leader>g', '<cmd>Goyo<CR>', mode = 'n', noremap = true, silent = true },
    },
    init = function()
      vim.g.goyo_width = 90
    end,
    config = function()
      local _fullscreen, _background, _linespace, _wrap, _scrolloff, _gui, _tmux

      -- Autocommands for GoyoEnter and GoyoLeave
      local function goyo_enter()
        _gui = false
        _tmux = false
        if vim.fn.has 'gui_running' == 1 then
          _gui = true
          _fullscreen = vim.o.fullscreen
          vim.o.fullscreen = true
          _background = vim.o.background
          vim.o.background = 'light'
          _linespace = vim.o.linespace
          vim.o.linespace = 7
        elseif vim.fn.exists '$TMUX' == 1 then
          _tmux = true
          vim.cmd 'silent !tmux set status off'
        end
        -- Disable autonumber and set options for distraction-free mode
        disable_autonumber()
        _wrap = vim.o.wrap
        vim.o.wrap = false
        vim.cmd 'Limelight'
        _scrolloff = vim.o.scrolloff
        vim.o.scrolloff = 999
      end

      local function goyo_leave()
        vim.o.scrolloff = _scrolloff
        vim.cmd 'Limelight!'
        if _gui then
          vim.o.fullscreen = _fullscreen
          vim.o.background = _background
          vim.o.linespace = _linespace
        elseif _tmux then
          vim.cmd 'silent !tmux set status on'
        end
        vim.o.wrap = _wrap
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
