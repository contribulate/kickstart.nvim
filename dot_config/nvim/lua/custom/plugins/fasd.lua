return {
  'nvim-lua/plenary.nvim', -- TODO Do not rely on a dummy dependency.
  -- Assuming you have fasd and fzf installed and working with Neovim
  init = function()
    -- Fasd update function equivalent in Lua
    local function fasd_update()
      local buftype = vim.bo.buftype
      local filetype = vim.bo.filetype

      -- Ensure buftype is empty or filetype is 'dirvish'
      if buftype == '' or filetype == 'dirvish' then
        -- Run the fasd command using jobstart
        vim.fn.jobstart { 'fasd', '-A', vim.fn.expand '%:p' }
      end
    end

    -- Create autocommand group for fasd
    vim.api.nvim_create_augroup('fasd', { clear = true })

    -- Autocommands for BufWinEnter and BufFilePost events
    vim.api.nvim_create_autocmd({ 'BufWinEnter', 'BufFilePost' }, {
      group = 'fasd',
      callback = fasd_update,
    })

    -- Define the custom FASD command
    local actions = require 'telescope.actions'
    local action_state = require 'telescope.actions.state'
    local pickers = require 'telescope.pickers'
    local finders = require 'telescope.finders'
    local conf = require('telescope.config').values

    vim.api.nvim_create_user_command('FASD', function()
      local handle = io.popen 'fasd -fl'

      if not handle then
        vim.notify("Error: Failed to run 'fasd' command", vim.log.levels.ERROR)
        return
      end

      local result = handle:read '*a'
      handle:close()

      local lines = {}
      for line in result:gmatch '[^\r\n]+' do
        table.insert(lines, line)
      end

      pickers
        .new({}, {
          prompt_title = 'FASD',
          finder = finders.new_table {
            results = lines,
          },
          sorter = conf.generic_sorter {},
          attach_mappings = function(_, map)
            map('i', '<CR>', function()
              local selection = action_state.get_selected_entry()
              actions.close(_)
              vim.cmd('edit ' .. selection.value)
            end)
            return true
          end,
        })
        :find()
    end, {})

    -- Key mapping for <Leader>e to trigger FASD
    vim.keymap.set('n', '<leader>e', ':FASD<CR>', { noremap = true, silent = true })

    -- Lua equivalent of the Z function to cd to recent/frequent directories
    local function Z(...)
      local args = { ... }
      -- Construct the fasd command
      local cmd = { 'fasd', '-d', '-e', 'printf' }
      for _, arg in ipairs(args) do
        table.insert(cmd, arg)
      end

      -- Run the fasd command and capture the output
      local path = vim.fn.system(cmd)

      -- Check if the path is a valid directory and change to it
      if vim.fn.isdirectory(path) == 1 then
        print('Changing directory to: ' .. path)
        vim.cmd('cd ' .. vim.fn.fnameescape(path))
      else
        print('Invalid directory: ' .. path)
      end
    end

    -- Create the Z command to call the Lua Z function
    vim.api.nvim_create_user_command('Z', function(opts)
      Z(unpack(opts.fargs)) -- Pass the arguments to the Z function
    end, { nargs = '*' }) -- Allow Z to take any number of arguments
  end,
}
